img  =imread("Code_runnable_photo_Color.png")
imshow(img)
numColors = 4;
L = imsegkmeans(img,numColors);
B = labeloverlay(img,L);
imshow(B)
title("Labeled Image RGB")