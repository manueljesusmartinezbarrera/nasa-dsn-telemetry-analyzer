% Script DSN Original: Analisis de Downlink (dBm) y Uplink (kW)
clear; clc; close all;

% Usamos el nombre de archivo original
nombre_archivo = 'dsn_historial.csv';

try
    % 'preserve' evita que MATLAB cambie los nombres de las columnas
    datos = readtable(nombre_archivo, 'VariableNamingRule', 'preserve');
catch
    error('No se encontro el archivo %s. Verifica que estas en la carpeta Descargas.', nombre_archivo);
end

% 1. Separar los datos en Recepcion y Transmision
datos_down = datos(strcmp(datos.Tipo_Senal, 'Downlink'), :);
datos_up = datos(strcmp(datos.Tipo_Senal, 'Uplink'), :);

% 2. Crear Figura Principal
figure('Name', 'Analisis DSN Completo', 'Color', 'white', 'Position', [100, 100, 900, 700]);

% ==========================================
% GRAFICA 1 (ARRIBA): DOWNLINK (Recepcion)
% ==========================================
subplot(2,1,1);
hold on;
bandas_down = categorical(datos_down.Banda);
misiones_down = categorical(datos_down.Mision);
cat_bandas_down = categories(bandas_down);
colores_down = lines(length(cat_bandas_down));

for i = 1:length(cat_bandas_down)
    idx = (bandas_down == cat_bandas_down{i});
    % Usamos circulos ('o') para recepcion
    scatter(misiones_down(idx), datos_down.Potencia(idx), 100, colores_down(i,:), 'o', 'filled', ...
        'MarkerEdgeColor', 'k', 'DisplayName', ['Banda ' char(cat_bandas_down{i})]);
end
title('Recepcion en Tierra (Downlink)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Potencia Recibida (dBm)', 'FontSize', 11);
grid on; ax = gca; ax.GridLineStyle = '--'; ax.GridAlpha = 0.7;
legend('Location', 'best');
hold off;

% ==========================================
% GRAFICA 2 (ABAJO): UPLINK (Transmision)
% ==========================================
subplot(2,1,2);
hold on;
bandas_up = categorical(datos_up.Banda);
misiones_up = categorical(datos_up.Mision);
cat_bandas_up = categories(bandas_up);
colores_up = lines(length(cat_bandas_up));

for i = 1:length(cat_bandas_up)
    idx = (bandas_up == cat_bandas_up{i});
    % Usamos triangulos hacia arriba ('^') para simbolizar transmision
    scatter(misiones_up(idx), datos_up.Potencia(idx), 100, colores_up(i,:), '^', 'filled', ...
        'MarkerEdgeColor', 'k', 'DisplayName', ['Banda ' char(cat_bandas_up{i})]);
end
title('Transmision hacia el Espacio (Uplink)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Potencia Emitida (kW)', 'FontSize', 11);
xlabel('Mision Espacial', 'FontSize', 12, 'FontWeight', 'bold');
grid on; ax = gca; ax.GridLineStyle = '--'; ax.GridAlpha = 0.7;
legend('Location', 'best');
hold off;

% 3. Exportar la imagen final
exportgraphics(gcf, 'Grafica_DSN_Completa.png', 'Resolution', 300);
disp('Grafica doble generada con exito como Grafica_DSN_Completa.png');