#! /usr/bin/env python

import subprocess
import sys

status_type = {
        "U": "updated",
        "M": "modified",
        "AM": "modified",
        "A": "added",
        "D": "deleted",
        "R": "renamed",
        "C": "copied",
        "??": "untracked"
}

def get_root_directory():
    root_path_cmd = "git rev-parse --show-toplevel"
    output = subprocess.Popen(root_path_cmd.split(), stdout=subprocess.PIPE).communicate()[0]
    return output

def long_list_files():
    list_files = []
    # Add --color to add color but remove the enhanced
    output = subprocess.Popen(["ls", "-la"], stdout=subprocess.PIPE).communicate()[0]
    output_lines = output.split("\n")
    output_lines = filter(None, output_lines)
    for line in output_lines:
        list_files.append(line.split())
    return list_files

def git_status_files():
    list_status_files = []
    git_status_cmd = "git status . --porcelain --ignored"
    output = subprocess.Popen(git_status_cmd.split(), stdout=subprocess.PIPE).communicate()[0]
    output_lines = output.split("\n")
    output_lines = filter(None, output_lines)
    for line in output_lines:
        list_status_files.append(line.split())
    return list_status_files

def enhanced_ls():
    git_files = git_status_files()
    list_files = long_list_files()
    for gfile in git_files:
        if gfile[0] in status_type:
            for lfile in list_files:
                if lfile[-1] == gfile[1] or lfile[-1] + '/' == gfile[1]:
                    #Here to change the print of the file
                    lfile[-1] = lfile[-1] + " [" + status_type[gfile[0]] + "]"
                else:
                    path_root = get_root_directory()
                    pwd = subprocess.Popen(["pwd"], stdout=subprocess.PIPE).communicate()[0]
                    if path_root == pwd:
                        new_gfile = gfile[1].split('/')
                        new_gfile = filter(None, new_gfile)
                        if lfile[-1] == new_gfile[0] or lfile[-1] + '/' == gfile[0]:
                            lfile[-1] = lfile[-1] + " [" + status_type[gfile[0]] + "]"
                        pass
                    list_path_root = path_root.split('/')
                    list_pwd = pwd.split('/')
                    for item_pwd in list(list_pwd):
                        for item_path_root in list_path_root:
                            if item_path_root == item_pwd:
                                list_pwd.remove(item_path_root)
                    if list_pwd:
                        list_pwd.pop(0)
                        #print("enhanced ls else : {}".format('/'.join(list_pwd)))
                        new_path = '/'.join(list_pwd).rstrip()

                        #print("gf : {} // lf: {}".format(gfile[1], new_path + '/' + lfile[-1]))
                        if gfile[1] == new_path + '/' + lfile[-1] or gfile[1] == new_path + '/' + lfile[-1] + '/':
                            #HEre to change the print of the file
                            lfile[-1] = lfile[-1] + " [" + status_type[gfile[0]] + "]"

        else:
            sys.stderr.write("Status type not found [" + gfile[0] + "]")
    for lfile in list_files:
        #modify here for pretty print
        print " ".join(word.ljust(4) for word in lfile)



def main():
    enhanced_ls()

if __name__ == "__main__":
    main()
