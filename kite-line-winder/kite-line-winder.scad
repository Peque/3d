use </cache/src/3d/kite-line-winder/scad-utils/morphology.scad>


difference() {
	difference() {
		difference() {
			difference() {
				difference() {
					intersection() {
						fillet(r = 5.0000000000) {
							union() {
								rounding(r = 10.0000000000) {
									difference() {
										polygon(paths = [[0, 1, 2]], points = [[-107.3205080757, 0], [0, 185.8845726812], [107.3205080757, 0]]);
										translate(v = [0, -93.7357142857, 0]) {
											circle($fn = 360, r = 127.3357142857);
										}
									}
								}
								fillet(r = 10.0000000000) {
									union() {
										difference() {
											rounding(r = 6.0000000000) {
												polygon(paths = [[0, 1, 2]], points = [[-116.3923048454, 80.0000000000], [0, 12.8008714659], [116.3923048454, 80.0000000000]]);
											}
											difference() {
												translate(v = [-94.0000000000, 40.0000000000, 0]) {
													square(size = [188.0000000000, 40.0000000000]);
												}
												intersection() {
													union() {
														translate(v = [-94.0000000000, 0, 0]) {
															translate(v = [0, -50.4500000000, 0]) {
																circle($fn = 360, r = 130.4500000000);
															}
														}
														mirror(v = [1, 0, 0]) {
															translate(v = [-94.0000000000, 0, 0]) {
																translate(v = [0, -50.4500000000, 0]) {
																	circle($fn = 360, r = 130.4500000000);
																}
															}
														}
													}
													translate(v = [-94.0000000000, 40.0000000000, 0]) {
														square(size = [188.0000000000, 40.0000000000]);
													}
												}
											}
										}
										translate(v = [0, 32.0000000000, 0]) {
											difference() {
												circle(r = 48.0000000000);
												translate(v = [-48.0000000000, -96.0000000000]) {
													square(size = 96.0000000000);
												}
											}
										}
									}
								}
							}
						}
						difference() {
							union() {
								difference() {
									translate(v = [-100, 0, 0]) {
										square(size = [200, 80.0000000000]);
									}
									difference() {
										translate(v = [-94.0000000000, 40.0000000000, 0]) {
											square(size = [188.0000000000, 40.0000000000]);
										}
										intersection() {
											union() {
												translate(v = [-94.0000000000, 0, 0]) {
													translate(v = [0, -50.4500000000, 0]) {
														circle($fn = 360, r = 130.4500000000);
													}
												}
												mirror(v = [1, 0, 0]) {
													translate(v = [-94.0000000000, 0, 0]) {
														translate(v = [0, -50.4500000000, 0]) {
															circle($fn = 360, r = 130.4500000000);
														}
													}
												}
											}
											translate(v = [-94.0000000000, 40.0000000000, 0]) {
												square(size = [188.0000000000, 40.0000000000]);
											}
										}
									}
								}
								fillet(r = 10.0000000000) {
									union() {
										difference() {
											rounding(r = 6.0000000000) {
												polygon(paths = [[0, 1, 2]], points = [[-116.3923048454, 80.0000000000], [0, 12.8008714659], [116.3923048454, 80.0000000000]]);
											}
											difference() {
												translate(v = [-94.0000000000, 40.0000000000, 0]) {
													square(size = [188.0000000000, 40.0000000000]);
												}
												intersection() {
													union() {
														translate(v = [-94.0000000000, 0, 0]) {
															translate(v = [0, -50.4500000000, 0]) {
																circle($fn = 360, r = 130.4500000000);
															}
														}
														mirror(v = [1, 0, 0]) {
															translate(v = [-94.0000000000, 0, 0]) {
																translate(v = [0, -50.4500000000, 0]) {
																	circle($fn = 360, r = 130.4500000000);
																}
															}
														}
													}
													translate(v = [-94.0000000000, 40.0000000000, 0]) {
														square(size = [188.0000000000, 40.0000000000]);
													}
												}
											}
										}
										translate(v = [0, 32.0000000000, 0]) {
											difference() {
												circle(r = 48.0000000000);
												translate(v = [-48.0000000000, -96.0000000000]) {
													square(size = 96.0000000000);
												}
											}
										}
									}
								}
							}
							translate(v = [0, -93.7357142857, 0]) {
								circle($fn = 360, r = 127.3357142857);
							}
						}
					}
					translate(v = [0, 63.2000000000, 0]) {
						resize(newsize = [40.0000000000, 17.6000000000]) {
							circle(r = 20.0000000000);
						}
					}
				}
				translate(v = [80.0000000000, 70.4000000000, 0]) {
					circle($fn = 360, r = 1.5000000000);
				}
			}
			translate(v = [-80.0000000000, 70.4000000000, 0]) {
				circle($fn = 360, r = 1.5000000000);
			}
		}
		translate(v = [50.0000000000, 60.0000000000, 0]) {
			circle($fn = 360, r = 1.5000000000);
		}
	}
	translate(v = [-50.0000000000, 60.0000000000, 0]) {
		circle($fn = 360, r = 1.5000000000);
	}
}
/***********************************************
*********      SolidPython code:      **********
************************************************
 
from math import sin, cos, tan, radians, sqrt, atan

from solid import *
from solid.utils import *


use('scad-utils/transformations.scad')
use('scad-utils/morphology.scad')


# Absolute dimensions
W = 100  # Half width
HW = 3  # Hole width
alpha = 30  # Legs outter angle
beta = 90  # Underarm angle

# Relative dimensions
H = W * 0.8  # Total height
P = H * 0.42  # Bottom penetration
C = H * 0.5  # Arms intersection
F = H * 0.1  # Forehead height
FH = H * 0.11  # Face height
FW = W * 0.2  # Face width
# Radii
RH = H * 0.6  # Head radius
RL = W * 0.1  # Legs rounding radius
RA = W * 0.06  # Arms rounding radius
RU = W * 0.05  # Underarm rounding radius
RS = W * 0.1  # Shoulder rounding radius
RF = H * 0.05  # Face rounding radius
# Holes
HW0 = W * 0.80
HH0 = H * 0.88
HW1 = W * 0.50
HH1 = H * 0.75



# Convert degrees to radians
alpha = radians(alpha)
beta = radians(beta)
gamma = radians(180) - alpha - beta


# Parameters
R0 = ((P - RL) ** 2 + (W - RL) ** 2 - RL ** 2) / (2. * P)

L1 = RL * ((1 + sin(alpha)) * tan(alpha) + cos(alpha) - 1) + W
L2 = RA * ((1 + sin(gamma)) * tan(gamma) + cos(gamma) - 1) + W
T1 = L1 / tan(alpha)
T2 = L2 / tan(gamma)

D = sqrt(C ** 2 + (W - RA) ** 2) / 2
delta = atan((W - RA) / C)
R3 = D * sqrt(1 + tan(delta) ** 2)


# Feet
bottom = circle(R0, segments=360)
bottom = back(R0 - P)(bottom)
feet = polygon([(-L1, 0), (0, T1), (L1, 0)])
feet -= bottom
feet = rounding(RL)(feet)

# Arms
arms = polygon([(-L2, H), (0, H - T2), (L2, H)])
arms = rounding(RA)(arms)
curve = circle(R3, segments=360)
curve = back(R3 - H)(curve)
curve = left(W - RA)(curve)
curve += mirror((1, 0, 0))(curve)
mask = square((2 * (W - RA), H - C))
mask = translate((-(W - RA), C, 0))(mask)
curve = intersection()(curve, mask)
curve = difference()(mask, curve)
arms -= curve

# Head
head = circle(RH)
head -= translate((-RH, -2 * RH))(square((2 * RH)))
head = forward(H - RH)(head)
arms += head
arms = fillet(RS)(arms)

# Mask
mask = left(W)(square((2 * W, H)))
mask -= curve
mask += arms
mask -= bottom

# Final outter design
design = feet + arms
design = fillet(RU)(design)
design = intersection()(design, mask)

# Face hole
face = circle(FW)
face = resize((2 * FW, 2 * FH))(face)
face = forward(H - FH - F)(face)
design -= face

# Holes
hole = circle(HW / 2., segments=360)
design -= translate((HW0, HH0, 0))(hole.copy())
design -= translate((-HW0, HH0, 0))(hole.copy())
design -= translate((HW1, HH1, 0))(hole.copy())
design -= translate((-HW1, HH1, 0))(hole.copy())

scad_render_to_file(design, './kite-line-winder.scad')
 
 
************************************************/
