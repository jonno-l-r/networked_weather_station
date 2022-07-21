import csv
import matplotlib.pyplot as plt


def reader(filename):
    data = dict(t=[],ch1=[],ch2=[],ch3=[],ch4=[])
    with open(filename, 'r', newline="") as f:
        csvfile = csv.reader(f)
        for row in csvfile:
            try:
                data["t"].append(float(row[0]))
                data["ch1"].append(float(row[1]))
                data["ch2"].append(float(row[2]))
                data["ch3"].append(float(row[3]))
                data["ch4"].append(float(row[4]))
            except (TypeError, ValueError) as e:
                continue
    return data


d = reader("data/old/NewFile1.csv")
plt.plot(d['t'], d['ch1'])
plt.plot(d['t'], d['ch2'])
plt.plot(d['t'], d['ch3'])
plt.plot(d['t'], d['ch4'])
plt.grid()
plt.show()
