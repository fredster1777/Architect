
import sys
import os

def RunRobotFile(FileName, path):
    os.system("Robot -d " + path + "\\"+ FileName + " --critical Critical -X " + FileName + ".robot")


def main():
    if not os.path.exists("Results"):
        print "Creating Results Directory"
        os.mkdir("Results")
        print "Done"
    else:
        print "Results Directory already exists"

    i = 1
    while True:
        if not os.path.exists("Results\\Run_" + str(i)):
            path = ("Results\\Run_" + str(i))
            print "Creating A directory to archive results in " + path
            os.mkdir(path)
            print "Done"
            break
        i += 1

    RunRobotFile("NewFeed", path)
































if __name__ == "__main__":
    main()