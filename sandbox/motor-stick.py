ms_poly = [
    [0,0],
    [0,-0.125],
    [0.25,-0.125],
    [0.25,0],
    [5.75,0],
    [5.75,-0.125],
    [6.0,-0.125],
    [6.0,0.125],
    [4.0,0.25],
    [2.0,0.25],
    [0,0.125],
    [0,0]
]

ms_blank = [
    [0,0],
    [6,0],
    [6,0.25],
    [0,0.25],
    [0,0]
]

def PolygonArea(corners):
    n = len(corners) # of corners
    area = 0.0
    for i in range(n):
        j = (i + 1) % n
        area += corners[i][0] * corners[j][1]
        area -= corners[j][0] * corners[i][1]
    area = abs(area) / 2.0
    return area

print(PolygonArea(ms_blank))
print(PolygonArea(ms_poly))

