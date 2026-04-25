🇪🇸 [ESPAÑOL]
Proyecto de exploración personal para bajar a la práctica los conceptos teóricos de telecomunicaciones utilizando datos reales de la Red de Espacio Profundo de la NASA (DSN).

Al estar en los primeros cursos de la carrera de Ingeniería de Telecomunicación, me apoyé en herramientas de Inteligencia Artificial para generar los scripts de programación en Python y MATLAB, centrándome en mi rol como ingeniero: definir la arquitectura del sistema, entender las telecomunicaciones espaciales y analizar los datos de radiofrecuencia resultantes.

Fases y análisis técnico:
🔹 Ingesta de datos: Generación de un pipeline para parsear el XML en directo de la API del DSN y extraer parámetros críticos de enlace (potencia, frecuencia, actividad de antena, misión).
🔹 Análisis del Link Budget: Comprobación empírica de la brutal asimetría de los radioenlaces. Observación del uso masivo de potencia en el Uplink terrestre (hasta 17 kW transmitidos desde la antena DSS63 en Madrid) frente a la recepción en el límite del ruido térmico en el Downlink (-130 dBm).
🔹 Gestión de Espectro y Distancia: Observación directa de cómo misiones lejanas (como Juno en Júpiter) requieren Banda X (~8 GHz) para mayor directividad, frente a la Banda S (~2 GHz) utilizada para misiones lunares (Artemis).

El código fuente y la extracción de datos están documentados en mi repositorio público de GitHub adjunto.

🇬🇧 [ENGLISH]
Personal exploration project to bring theoretical telecommunications concepts into practice using real-time data from NASA's Deep Space Network (DSN).

As a junior Telecommunications Engineering student, I leveraged Generative AI tools to assist with Python and MATLAB scripting. This allowed me to focus on my core role as an engineer: defining the system architecture, understanding space communications, and analyzing the resulting RF data.

Phases and technical analysis:
🔹 Data Ingestion: Built a pipeline to parse live XML from the DSN API, extracting critical link parameters (power, frequency, antenna activity, mission).
🔹 Link Budget Analysis: Empirical verification of extreme RF link asymmetry. Observed massive Uplink power from Earth (e.g., up to 17 kW from the DSS63 antenna in Madrid) versus Downlink reception at the thermal noise floor (-130 dBm).
🔹 Spectrum & Distance Management: Direct observation of how deep space missions (like Juno at Jupiter) require X-Band (~8 GHz) for higher directivity, compared to S-Band (~2 GHz) used for lunar missions (Artemis).

Source code and data extraction are fully documented in my attached public GitHub repository.
