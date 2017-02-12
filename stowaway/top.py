from cadquery import Workplane
from Helpers import show


# Enclosure dimensions
WIDTH = 180
LENGTH = 180
BOTTOM_HEIGHT = 30
TOP_HEIGHT = 10
THICK = 3

# Passthrough holes
PASS_INNER = 3
PASS_OUTTER = 8
PASS_CBORE = 6
PASS_CBORE_DEPTH = THICK / 2.
PASS_WIDTH = WIDTH - PASS_OUTTER
PASS_LENGTH = LENGTH - PASS_OUTTER

# Mesh dimensions
MESH_SPACE = 10
MESH_WIDTH = 6
MESH_LENGTH = 4

# CKIT dimensions
CKIT_WIDTH = 99
CKIT_LENGTH = 63
CKIT_CLEAR = 15
CKIT_INNER = 2
CKIT_OUTTER = 5
CKIT_HEIGHT = 20  # TODO: calculate this
CKIT_CENTER_WIDTH = (WIDTH - CKIT_WIDTH) / 2. - CKIT_CLEAR
CKIT_CENTER_LENGTH = (LENGTH - CKIT_LENGTH) / 2. - CKIT_CLEAR


def passthrough_vertices(face):
    workplane = face.workplane()
    rect = workplane.rect(PASS_WIDTH, PASS_LENGTH, forConstruction=True)
    return rect.vertices()


def enclosure_part(height):
    # Bottom enclosure part
    part = Workplane('XY').box(WIDTH, LENGTH, height)\
        .faces('+Z').shell(THICK)
    part = passthrough_vertices(part.faces('>Z'))\
        .rect(PASS_OUTTER, PASS_OUTTER).extrude(-height)\
        .edges('|Z').fillet(2)
    part = passthrough_vertices(part.faces('<Z'))\
        .cboreHole(PASS_INNER, PASS_CBORE, PASS_CBORE_DEPTH)
    return part


# Bottom enclosure
bottom = enclosure_part(BOTTOM_HEIGHT)

# CKIT mount
bottom = bottom.faces('<Z').workplane()\
    .center(CKIT_CENTER_WIDTH, CKIT_CENTER_LENGTH)\
    .rect(CKIT_WIDTH, CKIT_LENGTH, forConstruction=True).vertices()\
    .circle(CKIT_OUTTER / 2.).extrude(-THICK - CKIT_HEIGHT)
bottom = bottom.faces('<Z').workplane()\
    .center(CKIT_CENTER_WIDTH, CKIT_CENTER_LENGTH)\
    .rect(CKIT_WIDTH, CKIT_LENGTH, forConstruction=True).vertices()\
    .cboreHole(CKIT_INNER, CKIT_OUTTER, PASS_CBORE_DEPTH)


# Top enclosure
top = enclosure_part(TOP_HEIGHT)
top = top.mirror('XY')

# CKIT mesh
top = top.faces('<Z').workplane()\
    .center(CKIT_CENTER_WIDTH, CKIT_CENTER_LENGTH)\
    .rarray(MESH_SPACE, MESH_SPACE, MESH_WIDTH, MESH_LENGTH, center=False)\
    .rect(8, 8).cutThruAll()

top = top.translate((200, 0, 0))


# Render the solid
show(bottom)
show(top)
