import UIKit

//Adrian Sandoval
class Tablero {
    
    var limite: Int
    var reinas = [Reina]()
    
    init(_ limite: Int) {
        self.limite = limite
    }
    
    // Checa si (x,y) es una posición viable para una reina
    func checaPosicion(enFila fila: Int, col: Int) -> Bool {
        for reina in reinas {
            // No en la misma fila
            if reina.fila == fila { return false }
            // No en la misma columna
            if reina.col == col { return false }
            // No en la misma linea diagonal
            if abs(reina.fila-fila) == abs(reina.col-col) { return false }
        }
        return true
    }
    
    // Metodo recursivo
    func buscaReina(enFila fila: Int) {
        if reinas.count < limite {
            for col in 0...limite-1 {
                if checaPosicion(enFila: fila, col: col) {
                    let reina = Reina(fila: fila, col: col)
                    reinas.append(reina)
                    buscaReina(enFila: fila+1)
                    if reinas.count == limite {
                        print(salida()) // Se termino un tablero con una solución correcta
                        //limite = reinas.count + 1 // Esto es para que se salga del for y
                        //break                     // cuando encuentre una solución termine ahi
                    }
                    reinas.removeLast()
                }
            }
        }
    }
    
    func jugar() {
        buscaReina(enFila: 0) // El juego empieza en (0,0)
    }
    
    // Impresión de tablero con la solución
    func salida() -> String {
        var s = ""
        for reina in reinas {
            s += "(\(reina.fila),\(reina.col))"
        }
        return s
    }
}

struct Reina {
    var fila: Int
    var col:  Int
}

// Pruebas：
let t = Tablero(4)
t.jugar()
