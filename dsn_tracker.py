import xml.etree.ElementTree as ET
import urllib.request
import time
import csv
import os

def obtener_y_guardar_datos_dsn():
    url = 'https://eyes.nasa.gov/dsn/data/dsn.xml'
    archivo_csv = 'dsn_historial.csv'
    
    # Comprobamos si el archivo existe para escribir las cabeceras solo la primera vez
    archivo_existe = os.path.isfile(archivo_csv)

    try:
        respuesta = urllib.request.urlopen(url)
        xml_data = respuesta.read()
        root = ET.fromstring(xml_data)
        
        timestamp_ms = int(root.find('timestamp').text)
        hora_local = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(timestamp_ms / 1000))
        
        print(f"[{hora_local}] Obteniendo datos y guardando en {archivo_csv}...")

        # Abrimos el archivo CSV en modo "append" (añadir al final)
        with open(archivo_csv, mode='a', newline='', encoding='utf-8') as file:
            writer = csv.writer(file)
            
            # Escribimos las cabeceras si el archivo es nuevo
            if not archivo_existe:
                writer.writerow(['Fecha_Hora', 'Antena', 'Mision', 'Tipo_Senal', 'Banda', 'Potencia', 'Data_Rate_kbps'])

            for dish in root.findall('dish'):
                dish_name = dish.get('name')
                actividad = dish.get('activity')
                
                if "Spacecraft" not in actividad:
                    continue

                for down in dish.findall('downSignal'):
                    if down.get('active') == 'true' and down.get('signalType') == 'data':
                        nave = down.get('spacecraft')
                        potencia = down.get('power')
                        banda = down.get('band')
                        tasa_kbps = float(down.get('dataRate')) / 1000 
                        
                        # Guardamos en el CSV y mostramos en pantalla
                        writer.writerow([hora_local, dish_name, nave, 'Downlink', banda, potencia, tasa_kbps])
                        print(f"✅ Guardado: {nave} (Downlink) | {potencia} dBm | {tasa_kbps:.2f} kbps")

                for up in dish.findall('upSignal'):
                    if up.get('active') == 'true' and up.get('signalType') == 'data':
                        nave = up.get('spacecraft')
                        potencia = up.get('power') 
                        banda = up.get('band')
                        
                        writer.writerow([hora_local, dish_name, nave, 'Uplink', banda, potencia, 'N/A'])
                        print(f"✅ Guardado: {nave} (Uplink) | {potencia} kW")

        print("¡Proceso completado con éxito!\n")

    except Exception as e:
        print(f"Error al obtener los datos: {e}")

if __name__ == "__main__":
    obtener_y_guardar_datos_dsn()