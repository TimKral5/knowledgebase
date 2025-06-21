# Color Models

## Red-Green-Blue (RGB)

RGB is an additive color model, which means that it starts off from
the color black and then each of the three colors are added to it.

RGB is commonly used in systems that work with digital displays, since
they work the same way.

## Cyan-Magenta-Yellow-Key (CMYK)

CMYK is a subtractive color model, which means that it has pure white
as a base and the colors are then subtracted from it.

CMYK is commonly used in printing which it the reason there is an
additional property called "Key". The key typically stands for the
color black. This is because even though in theory having the
properties CMY to their maximal value should be a perfect black, in
reality that does not quite work out, which is why there is an
addition ink for grey-scales.

### Convert to RGB

Conversion to RGB is pretty straight forward since there is a direct
relation between the two systems. That relation is that each property
of RGB and CMY are opposites from each other, which means that the
bigger of R is the lower is the value C. The same goes for the other
values. Since the CMYK model has the value K as well, provided that it
stands for black, we can simply subtract K from all values of RGB,
too.

This leads to irreversable loss of data since the conversion back to
CMYK can not easilly recover the property K.

## YCrCb

This color model is commonly used by systems for recording video since
it divides up the luminance (brightness) and the chrominance (color)
data, which is essentially how a camera interprets an image.

### Conversion from RGB

The conversion from RGB to YCrCb works without any loss of data. We
simply need to define three constants needed to compute an authentic
luminance layer.

The following example values are often used:

$$
\begin{array}{l}
K_R = 0.3 \\
K_G = 0.6 \\
K_B = 0.1
\end{array}
$$

Now, the conversion can be done with the following equations:

$$
\begin{array}{lc}
Y' =& K_R \cdot R' + K_G \cdot G' + K_B \cdot B' \\
P_B =& \frac{1}{2} \cdot \frac{B' - Y'}{1 - K_B} \\
P_R =& \frac{1}{2} \cdot \frac{R' - Y'}{1 - K_R}
\end{array}
$$
