class TennisScorer
    def initialize
      # Inicializa el marcador con ambos jugadores en 0.
      @score = { sacador: 0, receptor: 0 }
    end
  
    def punto_para(jugador)
      # Incrementa el puntaje del jugador especificado.
      @score[jugador] += 1
    end
  
    def marcador
      case
      when @score[:sacador] == 0 && @score[:receptor] == 0
        "0-0"  # Cuando ambos jugadores tienen 0 puntos.
      when @score[:sacador] == 1 && @score[:receptor] == 0
        "15-0"  # Cuando el sacador tiene 1 punto y el receptor 0.
      when @score[:sacador] == 0 && @score[:receptor] == 1
        "0-15"  # Cuando el sacador tiene 0 puntos y el receptor 1.
      when @score[:sacador] == 1 && @score[:receptor] == 1
        "15-15"  # Cuando ambos tienen 1 punto.
      when @score[:sacador] == 3 && @score[:receptor] == 0
        "40-0"  # Cuando el sacador tiene 3 puntos y el receptor 0.
      when @score[:sacador] == 4 && @score[:receptor] == 0
        "W-L"  # Cuando el sacador gana.
      when @score[:sacador] == 0 && @score[:receptor] == 4
        "L-W"  # Cuando el receptor gana.
      when @score[:sacador] == 3 && @score[:receptor] == 3
        "Deuce"  # Cuando están empatados a 3 puntos.
      when @score[:sacador] == 4 && @score[:receptor] == 3
        "SACADOR con ventaja"  # Cuando el sacador tiene ventaja.
      when @score[:sacador] == 3 && @score[:receptor] == 4
        "RECEPTOR con ventaja"  # Cuando el receptor tiene ventaja.
      end
    end
  end
  