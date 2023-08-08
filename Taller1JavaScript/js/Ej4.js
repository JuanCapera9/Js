// Datos del trabajador
const salarioBasico = 3500000; // Salario básico mensual
const horasExtrasDiurnas = 3; // Horas extras diurnas trabajadas semanalmente
const horasExtrasNocturnas = 3; // Horas extras nocturnas trabajadas semanalmente

// Datos adicionales
const valorHoraOrdinaria = 100000; // Valor de la hora ordinaria
const recargoHoraExtraDiurna = 0.25; // Recargo por hora extra diurna (25%)
const recargoHoraExtraNocturna = 0.5; // Recargo por hora extra nocturna (50%)
const tasaAporteSalud = 0.08; // Tasa de aporte a salud (8%)
const tasaAportePension = 0.12; // Tasa de aporte a pensión (12%)
const valorAuxilioTransporte = 100000; // Valor del auxilio de transporte

// Cálculos
const valorHorasExtrasDiurnas = valorHoraOrdinaria * recargoHoraExtraDiurna;
const valorHorasExtrasNocturnas = valorHoraOrdinaria * recargoHoraExtraNocturna;
const valorTotalHorasExtras = (valorHorasExtrasDiurnas + valorHorasExtrasNocturnas) * (horasExtrasDiurnas + horasExtrasNocturnas);
const valorDevengado = salarioBasico + valorTotalHorasExtras;
const totalDeducciones = salarioBasico * tasaAporteSalud + salarioBasico * tasaAportePension;
const netoAPagar = valorDevengado - totalDeducciones + valorAuxilioTransporte;

// Resultados
console.log("Auxilio de transporte:", valorAuxilioTransporte);
console.log("Valor horas extras diurnas:", valorHorasExtrasDiurnas);
console.log("Valor horas extras nocturnas:", valorHorasExtrasNocturnas);
console.log("Valor total horas extras:", valorTotalHorasExtras);
console.log("Valor devengado:", valorDevengado);
console.log("Total deducciones:", totalDeducciones);
console.log("Neto a pagar:", netoAPagar);





