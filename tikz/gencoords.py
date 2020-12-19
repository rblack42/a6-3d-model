import math

x_coord = [
    0.0,
    2.50,
    4.90,
    6.80,
    8.10,
    8.70,
]

y_coord = [
    0.00,
    1.98,
    0.00,
    1.80,
    0.00,
    1.13,
    0.50,
]

alpha1 = math.atan2(y_coord[1] - y_coord[3],x_coord[3] - x_coord[1])
alpha2 = math.atan2(y_coord[1] - y_coord[5],x_coord[4] - x_coord[2])
alpha3 = math.atan2(y_coord[1] - y_coord[6],x_coord[5] - x_coord[4])

print(alpha1 * 180/math.pi)
print(alpha2 * 180/math.pi)
print(alpha3 * 180/math.pi)

# calculate intermediate chord values

y_coord[2] = y_coord[1] - (x_coord[1] - x_coord[0]) * math.tan(alpha1)
y_coord[4] = y_coord[3] - (x_coord[4] - x_coord[3]) * math.tan(alpha2)

wing_coords = [
    [x_coord[0], y_coord[0]],
    [x_coord[1], y_coord[0]],
    [x_coord[2], y_coord[0]],
    [x_coord[3], y_coord[0]],
    [x_coord[5], y_coord[0]],
    [x_coord[5], y_coord[6]],
    [x_coord[4], y_coord[5]],
    [x_coord[3], y_coord[4]],
    [x_coord[2], y_coord[3]],
    [x_coord[1], y_coord[2]],
    [x_coord[0], y_coord[1]],
]

PREAMBLE = """
\documentclass[tikz]{standalone}
\usepackage{tikz}

\\begin{document}

\\begin{tikzpicture}
"""

POSTAMBLE = """
\\end{tikzpicture}

\\end{document}
"""

def draw_wing():
    fout = open('draw_wing.tex','w')
    fout.write(PREAMBLE)

    fout.write("\draw[thick]\n")
    fout.write("\t   (%4.2f,%4.2f)\n" % (wing_coords[0][0],wing_coords[0][1]))
    for pt in range(1,11):
        fout.write("\t-- (%4.2f,%4.2f)" % (wing_coords[pt][0],wing_coords[pt][1]))
        if pt == 10:
            fout.write(";\n")
        else:
            fout.write("\n")

    fout.write(POSTAMBLE)
    fout.close()


draw_wing()

