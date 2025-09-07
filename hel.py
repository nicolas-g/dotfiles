# bad_script.py

import os,sys,time

def main():
    name = input("Enter your name: ")
    print("Hello " + name)
    f = open("data.txt","r")
    data = f.readlines()
    for i in range(0,len(data)):
        print(i, data[i])
        time.sleep(1)
    f.close()

    numbers = [1,2,3,4,5]
    total = 0
    for n in numbers:
        total = total + n
    print("Total is " + str(total))

main()
