import csv
import matplotlib.pyplot as plt


def reader(filename, offset=0, t_scale=1):
    data = dict(t=[],ch1=[],ch2=[],ch3=[],ch4=[])
    with open(filename, 'r', newline="") as f:
        csvfile = csv.reader(f)
        next(csvfile)
        t_delta = float(next(csvfile)[-1])
        for row in csvfile:
            try:
                data["t"].append(float(row[0])*t_delta*t_scale)
                data["ch1"].append(float(row[1])-1.75+offset*2)
                data["ch2"].append(float(row[2])-1.75+offset)
                data["ch3"].append(float(row[3])+1.75-offset)
                data["ch4"].append(float(row[4])+1.75-offset*2)
            except (TypeError, ValueError) as e:
                continue
    return data


d = reader("debug/spi_ver_1.csv", offset=3.5, t_scale=1e6)
plt.plot(d['t'], d['ch1'], label="SS")
plt.plot(d['t'], d['ch2'], label="SCLK")
plt.plot(d['t'], d['ch3'], label="MISO")
plt.plot(d['t'], d['ch4'], label="MOSI")

plt.title(
    "SPI at TXB0104D 3.3V side\n"\
    "transmission sequence 0x00 0x00 0x39 0x00"
)
plt.xlabel(r'Time $(\mu s)$')
plt.ylabel("Volts")
plt.legend(loc="upper left")
plt.grid(which="both", linewidth=0.5)
plt.minorticks_on()
plt.show()
