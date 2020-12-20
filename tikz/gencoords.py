import math

x_right_coord = [
    0.0,
    2.50,
    4.90,
    6.90,
    8.20,
    8.80,
]

x_left_coord = [
    0.00,
    2.80,
    5.50,
    7.45,
    8.75,
    9.35
]
y_right_coord = [
    0.00,
    1.98,
    0.00,
    1.80,
    0.00,
    1.13,
    0.50,
]

y_left_coord = [
    0.00,
    1.98,
    0.00,
    1.80,
    0.00,
    1.13,
    0.50
]

alpha1r = math.atan2(y_right_coord[1] - y_right_coord[3],x_right_coord[3] - x_right_coord[1])
alpha2r = math.atan2(y_right_coord[1] - y_right_coord[5],x_right_coord[4] - x_right_coord[2])
alpha3r = math.atan2(y_right_coord[1] - y_right_coord[6],x_right_coord[5] - x_right_coord[4])

print(alpha1r * 180/math.pi)
print(alpha2r * 180/math.pi)
print(alpha3r * 180/math.pi)

alpha1l = math.atan2(y_left_coord[1] - y_left_coord[3],x_left_coord[3] - x_left_coord[1])
alpha2l = math.atan2(y_left_coord[1] - y_left_coord[5],x_left_coord[4] - x_left_coord[2])
alpha3l = math.atan2(y_left_coord[1] - y_left_coord[6],x_left_coord[5] - x_left_coord[4])

print(alpha1l * 180/math.pi)
print(alpha2l * 180/math.pi)
print(alpha3l * 180/math.pi)

# calculate intermediate chord values

y_right_coord[2] = y_right_coord[1] - (x_right_coord[1] - x_right_coord[0]) * math.tan(alpha1r)
y_right_coord[4] = y_right_coord[3] - (x_right_coord[4] - x_right_coord[3]) * math.tan(alpha2r)

y_left_coord[2] = y_left_coord[1] - (x_left_coord[1] - x_left_coord[0]) * math.tan(alpha1l)
y_left_coord[4] = y_left_coord[3] - (x_left_coord[4] - x_left_coord[3]) * math.tan(alpha2l)

wing_coords = [
    [x_right_coord[0], y_right_coord[0]],
    [x_right_coord[1], y_right_coord[0]],
    [x_right_coord[2], y_right_coord[0]],
    [x_right_coord[3], y_right_coord[0]],
    [x_right_coord[5], y_right_coord[0]],
    [x_right_coord[5], y_right_coord[6]],
    [x_right_coord[4], y_right_coord[5]],
    [x_right_coord[3], y_right_coord[4]],
    [x_right_coord[2], y_right_coord[3]],
    [x_right_coord[1], y_right_coord[2]],
    [x_right_coord[0], y_right_coord[1]],
    [-x_left_coord[0], y_left_coord[0]],
    [-x_left_coord[1], y_left_coord[0]],
    [-x_left_coord[2], y_left_coord[0]],
    [-x_left_coord[3], y_left_coord[0]],
    [-x_left_coord[5], y_left_coord[0]],
    [-x_left_coord[5], y_left_coord[6]],
    [-x_left_coord[4], y_left_coord[5]],
    [-x_left_coord[3], y_left_coord[4]],
    [-x_left_coord[2], y_left_coord[3]],
    [-x_left_coord[1], y_left_coord[2]],
    [-x_left_coord[0], y_left_coord[1]],
]

PREAMBLE = """
\\documentclass[tikz]{standalone}
\\usepackage{tikz}

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

    # draw wing outline
    fout.write("\draw[thick]\n")
    fout.write("\t   (%4.2f,%4.2f)\n" % (wing_coords[0][0],wing_coords[0][1]))
    for pt in range(1,22):
        fout.write("\t-- (%4.2f,%4.2f)" % (wing_coords[pt][0],wing_coords[pt][1]))
        if pt == 21:
            fout.write(";\n")
        else:
            fout.write("\n")

    fout.write("/n% draw wing ribs\n")
    for i in range(7,11):
        rib_x = wing_coords[i][0]
        rib_y = wing_coords[i][1]
        fout.write("\draw[thin] (%4.2f,%4.2f) -- (%4.2f,%4.2f);\n" %
                    (rib_x,0.0,rib_x,rib_y))
    for i in range(18,21):
        rib_x = wing_coords[i][0]
        rib_y = wing_coords[i][1]
        fout.write("\draw[thin] (%4.2f,%4.2f) -- (%4.2f,%4.2f);\n" %
                    (rib_x,0.0,rib_x,rib_y))

    fout.write(POSTAMBLE)
    fout.close()


draw_wing()
for l in wing_coords:
    print(l)

