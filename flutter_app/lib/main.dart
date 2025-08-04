import 'package:flutter/material.dart';

void main() {
  runApp(const PerdidasInsensiblesApp());
}

class PerdidasInsensiblesApp extends StatelessWidget {
  const PerdidasInsensiblesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Pérdidas Insensibles',
      theme: ThemeData(
        // Configuración del tema oscuro
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primarySwatch: MaterialColor(
          0xFF00C853,
          <int, Color>{
            50: const Color(0xFFE8F5E8),
            100: const Color(0xFFC8E6C9),
            200: const Color(0xFFA5D6A7),
            300: const Color(0xFF81C784),
            400: const Color(0xFF66BB6A),
            500: const Color(0xFF00C853),
            600: const Color(0xFF00B04F),
            700: const Color(0xFF00962A),
            800: const Color(0xFF007C1F),
            900: const Color(0xFF005210),
          },
        ),
        colorScheme: const ColorScheme.dark(
          background: Color(0xFF121212),
          surface: Color(0xFF1E1E1E),
          primary: Color(0xFF00C853),
          secondary: Color(0xFF424242),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const CalculadoraScreen(),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  // Variables para los sliders
  double peso = 70.0;
  double temperatura = 36.5;
  double horas = 7.0;
  double? resultado;

  /// Función para calcular las pérdidas insensibles
  void calcular() {
    // Calcular la constante de temperatura
    double constanteTemp = 0.5;
    
    if (temperatura > 37.5) {
      constanteTemp = 0.5 + ((temperatura - 37.5) * 0.1);
    } else if (temperatura < 36.5) {
      constanteTemp = 0.5 - ((36.5 - temperatura) * 0.1);
    }

    // Aplicar la fórmula: Peso × Horas × ConstanteTemp
    setState(() {
      resultado = peso * horas * constanteTemp;
    });
  }

  /// Función para resetear todos los valores a sus valores iniciales
  void reset() {
    setState(() {
      peso = 70.0;
      temperatura = 36.5;
      horas = 7.0;
      resultado = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título principal
              const SizedBox(height: 20),
              const Text(
                'Calculadora de Pérdidas Insensibles',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 40),
              
              // Slider de Peso
              _buildSlider(
                label: 'Peso',
                value: peso,
                min: 25,
                max: 150,
                unit: 'kg',
                onChanged: (value) {
                  setState(() {
                    peso = value;
                  });
                },
              ),
              
              const SizedBox(height: 30),
              
              // Slider de Temperatura
              _buildSlider(
                label: 'Temperatura',
                value: temperatura,
                min: 33,
                max: 41,
                unit: '°C',
                divisions: 80, // Para permitir incrementos de 0.1
                onChanged: (value) {
                  setState(() {
                    temperatura = double.parse(value.toStringAsFixed(1));
                  });
                },
              ),
              
              const SizedBox(height: 30),
              
              // Slider de Horas
              _buildSlider(
                label: 'Horas de estancia',
                value: horas,
                min: 1,
                max: 24,
                unit: 'h',
                onChanged: (value) {
                  setState(() {
                    horas = value;
                  });
                },
              ),
              
              const SizedBox(height: 50),
              
              // Botón Calcular
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: calcular,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C853),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Botón Reset
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF424242),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Card de resultado
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Resultado',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      resultado != null 
                          ? '${resultado!.toStringAsFixed(2)} ml'
                          : '-- ml',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Texto informativo
              const Text(
                'Valores recomendados: Temp normal 36.5 a 37.5°C',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget helper para crear los sliders personalizados
  Widget _buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required String unit,
    int? divisions,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Etiqueta y valor actual
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              '${value.toStringAsFixed(value == value.roundToDouble() ? 0 : 1)} $unit',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4CAF50),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 8),
        
        // Slider
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF4CAF50),
            inactiveTrackColor: const Color(0xFF424242),
            thumbColor: const Color(0xFF4CAF50),
            overlayColor: const Color(0xFF4CAF50).withOpacity(0.2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
            trackHeight: 6,
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions ?? (max - min).round(),
            onChanged: onChanged,
          ),
        ),
        
        // Indicadores de rango
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${min.toStringAsFixed(min == min.roundToDouble() ? 0 : 1)} $unit',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              '${max.toStringAsFixed(max == max.roundToDouble() ? 0 : 1)} $unit',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}