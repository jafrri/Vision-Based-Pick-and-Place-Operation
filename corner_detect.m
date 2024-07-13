function [X,Y]=corner_detect(BW)
V=uniquetol(  pgonCorners(BW,2)  ,3,'DataScale',1,'ByRows',true) ;

[I,J]=deal(V(:,1), V(:,2));
[~,top2]=mink(I,2);
[~,bottom2]=maxk(I,2);
X=J([top2;bottom2]); Y=I([top2;bottom2]);
imshow(BW); hold on
scatter(X,Y,'filled','MarkerFaceColor','r','SizeData',80);hold off
end