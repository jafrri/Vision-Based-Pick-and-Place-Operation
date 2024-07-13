function refined_mask=mask_refine_blue(image)
    [image_BW mask_blue] = createblueMask(image);
    se_blue=strel('square',2);
    img_erode_blue=imerode(image_BW,se_blue);
    dilate_se_blue = strel('square',5);
    refined_mask=imdilate(img_erode_blue,dilate_se_blue);
end