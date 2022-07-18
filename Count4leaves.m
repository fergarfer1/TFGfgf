% Count of leaves in a plant

predicciones = zeros(466,1);
aux = 0;
aux2 = 1;

for n=1:2069
    % Archivo
    archivo = [num2str(aux) '.png'];
    ruta = ['C:\Users\ferga\Documents\MATLAB\TFG\4_mod\' num2str(aux) '.png'];
    if isfile(ruta)
        % Convert image to BMW
        K = imresize(imread(strcat('C:\Users\ferga\Documents\MATLAB\TFG\4_mod\',archivo)),[100 150]);
        img0=rgb2gray(K);
        img1 = imbinarize(img0);
        % Fill image regions and holes
        img2 = imfill(img1,'holes');
        % Label and count connected components
        [L,Ne] = bwlabel(double(img2));
        % Measure properties of image region
        prop = regionprops(L, 'Area');
        % Counter
        total = 0;
        %Count
        for k=1:size(prop,1)
            if prop(k).Area > 20
                total=total+1;
            else
                total=total+0;
            end
        end
        predicciones(aux2,1)=total;
        aux = aux+1;
        aux2 = aux2 + 1;
    else
        aux=aux+1;
    end
end

Prediccion = sum(predicciones==4);
Porcentaje = (Prediccion/length(predicciones))*100;
disp(Porcentaje)