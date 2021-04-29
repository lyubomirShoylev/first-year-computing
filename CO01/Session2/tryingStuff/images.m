subplot(2, 2, 1);image(myimage);axis image;title('original');
subplot(2, 2, 2);image(flippedY(myimage));axis image;title('flipped y');
subplot(2, 2, 3);image(flippedX(myimage));axis image;title('flipped x');
subplot(2, 2, 4);image(flippedY(flippedX(myimage)));axis image;title('flipped x and y');