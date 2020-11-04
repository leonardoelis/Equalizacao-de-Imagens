close all; clear all; clc;

%%Leitura da imagem
I = imread('paisagem.jpg');
figure
imshow(I);

%%Separa nas componentes RGB
figure
subplot(2,2,1)
imshow(I);
title('Imagem Original')

red = I(:, :, 1);
subplot(2,2,2), imshow(red);
title('Canal vermelho')

green = I(:, :, 2);
subplot(2,2,3), imshow(green);
title('Canal verde')

blue = I(:, :, 3);
subplot(2,2,4), imshow(blue);
title('Canal azul')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SEM EQUALIZACAO DE INTENSIDADE

%Aplica a equalizacao em cada canal
eqR = histeq(red);

eqG = histeq(green);

eqB = histeq(blue);

%Recupera a imagem
img_eq(:, :, 1) = eqR;
img_eq(:, :, 2) = eqG;
img_eq(:, :, 3) = eqB;

figure
subplot(1,2,1), imshow(I);
title('Imagem Original');
subplot(1,2,2), imshow(img_eq);
title('Imagem Equalizada');

figure
subplot(3, 1, 1), imhist(I(:, :, 1));
title('histograma Original R');
%xlim([-10 265]);
subplot(3, 1, 2), imhist(I(:, :, 2));
title('histograma Original G');
subplot(3, 1, 3), imhist(I(:, :, 3));
title('histograma Original B');

figure
subplot(3, 1, 1), imhist(img_eq(:, :, 1));
title('Equalização do histograma R');
subplot(3, 1, 2), imhist(img_eq(:, :, 2));
title('Equalização do histograma G');
subplot(3, 1, 3), imhist(img_eq(:, :, 3));
title('Equalização do histograma B');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COM EQUALIZACAO DE INTENSIDADE
eqR = histeq(red);

eqG = histeq(green);

eqB = histeq(blue);

img_eq(:, :, 1) = eqR;
img_eq(:, :, 2) = eqG;
img_eq(:, :, 3) = eqB;

HSV = rgb2hsv(img_eq);

img_eq2 = histeq(HSV(:, :, 3));

HSV_mod = HSV;
HSV_mod(:, :, 3) = img_eq2;

RGB = hsv2rgb(HSV_mod);
figure
subplot(1,2,2), imshow(RGB);
title('Imagem equalizada')

subplot(1,2,1), imshow(I);
title('Imagem Original');

figure
subplot(3, 1, 1), imhist(I(:, :, 1));
title('histograma Original R');
%xlim([-10 265]);
subplot(3, 1, 2), imhist(I(:, :, 2));
title('histograma Original G');
subplot(3, 1, 3), imhist(I(:, :, 3));
title('histograma Original B');

figure
subplot(3, 1, 1), imhist(RGB(:, :, 1));
title('Equalização do histograma R');
subplot(3, 1, 2), imhist(RGB(:, :, 2));
title('Equalização do histograma G');
subplot(3, 1, 3), imhist(RGB(:, :, 3));
title('Equalização do histograma B');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COMPARANDO AS DUAS EQUALIZACOES
figure
subplot(2,2,1), imshow(I);
title('Imagem Original');
subplot(2,2,2), imshow(RGB);
title('Imagem Equalizada Intensidade');
subplot(2,2,3), imshow(img_eq);
title('Imagem Equalizada');

%Mostrando so as equalizacoes
figure
subplot(1,2,1), imshow(RGB);
title('Imagem Equalizada Intensidade');
subplot(1,2,2), imshow(img_eq);
title('Imagem Equalizada');

figure
subplot(3, 1, 1), imhist(I(:, :, 1));
title('histograma Original R');
subplot(3, 1, 2), imhist(I(:, :, 2));
title('histograma Original G');
subplot(3, 1, 3), imhist(I(:, :, 3));
title('histograma Original B');

figure
subplot(3, 1, 1), imhist(img_eq(:, :, 1));
title('Equalização do histograma R');
subplot(3, 1, 2), imhist(img_eq(:, :, 2));
title('Equalização do histograma G');
subplot(3, 1, 3), imhist(img_eq(:, :, 3));
title('Equalização do histograma B');

figure
subplot(3, 1, 1), imhist(RGB(:, :, 1));
title('Equalização do histograma R');
subplot(3, 1, 2), imhist(RGB(:, :, 2));
title('Equalização do histograma G');
subplot(3, 1, 3), imhist(RGB(:, :, 3));
title('Equalização do histograma B');
