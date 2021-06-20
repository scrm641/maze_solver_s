clear; clc; close all;
x = 20;
y = 450;
a = imread('mazep1.png');
J = imresize(a,[480 640]);
figure (1), subplot(3,3,2)
imshow (a), title('Imagen')

imshow (J), title('Imagen con resolucion 480x640')
ar = J(:,:,1); % Capa roja
ag = J(:,:,2); % Capa verde
ab = J(:,:,3); % Capa azul

figure (1), subplot(3,3,4),imshow (ar), title('R')
figure (1), subplot(3,3,5),imshow (ag), title('G')
figure (1), subplot(3,3,6),imshow (ab), title('B')

cover_red(:,:,1) = ar; cover_red(:,:,2) = 0; cover_red(:,:,3) = 0;
cover_green(:,:,2) = ag;cover_green(:,:,1) = 0; cover_green(:,:,3) = 0;
cover_blue(:,:,3) = ab; cover_blue(:,:,1) = 0; cover_blue(:,:,2) = 0; 

figure (1), subplot(3,3,7),imshow (cover_red), title('R')
figure (1), subplot(3,3,8),imshow (cover_green), title('G')
figure (1), subplot(3,3,9),imshow (cover_blue), title('B')

nr = round(ar/16) * 16;
ng = round(ag/16) * 16;
nb = round(ab/16) * 16;

n_image(:,:,1) = nr;
n_image(:,:,2) = ng;
n_image(:,:,3) = nb;

pi(1) = n_image(y,x,1);
pi(2) = n_image(y,x,2);
pi(3) = n_image(y,x,3);

m = zeros(480, 640);

for i=1:480
    for j=1:640
        if ( (n_image(i,j,1) == pi(1) ) && (n_image(i,j,2) == pi(2)) && (n_image(i,j,3) == pi(3)) )
            m(i,j) = 256;
        else
            m(i,j) = 0;
        end
    end
end

figure (3)
subplot(1,2,1),imshow(n_image), title('RGB444 480x640')
subplot(1,2,2),imshow(J), title('RGB888 480x640')
figure (4)
imshow(m), title('Mapa de rutas accesibles')
