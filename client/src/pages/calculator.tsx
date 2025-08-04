import { useState, useEffect } from "react";
import { Card, CardContent } from "@/components/ui/card";

export default function Calculator() {
  const [weight, setWeight] = useState(70);
  const [temperature, setTemperature] = useState(36.5);
  const [hours, setHours] = useState(7);
  const [result, setResult] = useState<number | null>(null);
  const [showResult, setShowResult] = useState(false);

  // Función para calcular las pérdidas insensibles
  const calculateResult = () => {
    // Calcular la constante de temperatura
    let tempConstant = 0.5;
    
    if (temperature > 37.5) {
      tempConstant = 0.5 + ((temperature - 37.5) * 0.1);
    } else if (temperature < 36.5) {
      tempConstant = 0.5 - ((36.5 - temperature) * 0.1);
    }

    // Aplicar la fórmula: Peso × Horas × ConstanteTemp
    const calculatedResult = weight * hours * tempConstant;
    setResult(calculatedResult);
    setShowResult(true);
  };

  // Función para resetear todos los valores
  const resetValues = () => {
    setWeight(70);
    setTemperature(36.5);
    setHours(7);
    setResult(null);
    setShowResult(false);
  };

  return (
    <div className="max-w-md mx-auto min-h-screen" style={{ backgroundColor: 'var(--dark-bg)' }}>
      {/* Header */}
      <div className="pt-12 pb-8 px-6">
        <h1 className="text-2xl font-semibold text-center text-white">
          Calculadora de Pérdidas Insensibles
        </h1>
      </div>

      {/* Slider Controls */}
      <div className="px-6 space-y-8">
        {/* Peso Slider */}
        <div className="space-y-3">
          <div className="flex justify-between items-center">
            <label className="text-lg font-medium text-white">Peso</label>
            <span 
              className="text-lg font-medium" 
              style={{ color: 'var(--slider-green)' }}
              data-testid="weight-display"
            >
              {weight} kg
            </span>
          </div>
          <div className="relative">
            <input 
              type="range" 
              min="25" 
              max="150" 
              value={weight} 
              className="w-full custom-slider" 
              data-testid="weight-slider"
              onChange={(e) => setWeight(parseInt(e.target.value))}
            />
            <div className="flex justify-between text-xs text-gray-400 mt-1">
              <span>25 kg</span>
              <span>150 kg</span>
            </div>
          </div>
        </div>

        {/* Temperatura Slider */}
        <div className="space-y-3">
          <div className="flex justify-between items-center">
            <label className="text-lg font-medium text-white">Temperatura</label>
            <span 
              className="text-lg font-medium" 
              style={{ color: 'var(--slider-green)' }}
              data-testid="temperature-display"
            >
              {temperature}°C
            </span>
          </div>
          <div className="relative">
            <input 
              type="range" 
              min="33" 
              max="41" 
              value={temperature} 
              step="0.1" 
              className="w-full custom-slider" 
              data-testid="temperature-slider"
              onChange={(e) => setTemperature(parseFloat(e.target.value))}
            />
            <div className="flex justify-between text-xs text-gray-400 mt-1">
              <span>33°C</span>
              <span>41°C</span>
            </div>
          </div>
        </div>

        {/* Horas Slider */}
        <div className="space-y-3">
          <div className="flex justify-between items-center">
            <label className="text-lg font-medium text-white">Horas de estancia</label>
            <span 
              className="text-lg font-medium" 
              style={{ color: 'var(--slider-green)' }}
              data-testid="hours-display"
            >
              {hours} h
            </span>
          </div>
          <div className="relative">
            <input 
              type="range" 
              min="1" 
              max="24" 
              value={hours} 
              className="w-full custom-slider" 
              data-testid="hours-slider"
              onChange={(e) => setHours(parseInt(e.target.value))}
            />
            <div className="flex justify-between text-xs text-gray-400 mt-1">
              <span>1 h</span>
              <span>24 h</span>
            </div>
          </div>
        </div>
      </div>

      {/* Action Buttons */}
      <div className="px-6 mt-10 space-y-4">
        {/* Calculate Button */}
        <button 
          className="w-full text-white text-lg font-semibold py-4 rounded-lg btn-calculate"
          onClick={calculateResult}
          data-testid="calculate-button"
        >
          Calcular
        </button>

        {/* Reset Button */}
        <button 
          className="w-full text-white text-base font-medium py-3 rounded-lg btn-reset"
          onClick={resetValues}
          data-testid="reset-button"
        >
          Reset
        </button>
      </div>

      {/* Result Card */}
      <div className="px-6 mt-8">
        <Card className={`result-card ${showResult ? 'show-result' : ''}`}>
          <CardContent className="p-6">
            <div className="text-center">
              <div className="text-gray-400 text-sm mb-2">Resultado</div>
              <div 
                className="text-3xl font-bold text-white" 
                data-testid="result-display"
              >
                {result !== null ? `${result.toFixed(2)} ml` : '-- ml'}
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Info Text */}
      <div className="px-6 mt-6 pb-8">
        <p className="text-sm text-gray-400 text-center">
          Valores recomendados: Temp normal 36.5 a 37.5°C
        </p>
      </div>
    </div>
  );
}
