
RSpec.describe "TennisScorer" do
    describe "puntuación básica" do
      it "empieza con un marcador de 0-0" do
        # Crea una instancia de TennisScorer.
        scorer = TennisScorer.new
        # Verifica que el marcador inicial sea "0-0".
        expect(scorer.marcador).to eq("0-0")
      end
  
      it "hace que el marcador sea 15-0 si el sacador gana un punto" do
        # Crea una instancia de TennisScorer.
        scorer = TennisScorer.new
        # Aumenta el puntaje del sacador en 1 punto.
        scorer.punto_para(:sacador)
        # Verifica que el marcador sea "15-0".
        expect(scorer.marcador).to eq("15-0")
      end
  
      it "hace que el marcador sea 0-15 si el receptor gana un punto" do
        # Crea una instancia de TennisScorer.
        scorer = TennisScorer.new
        # Aumenta el puntaje del receptor en 1 punto.
        scorer.punto_para(:receptor)
        # Verifica que el marcador sea "0-15".
        expect(scorer.marcador).to eq("0-15")
      end
  
      it "hace que el marcador sea 15-15 después de que ambos ganen un punto" do
        # Crea una instancia de TennisScorer.
        scorer = TennisScorer.new
        # Aumenta el puntaje del sacador en 1 punto.
        scorer.punto_para(:sacador)
        # Aumenta el puntaje del receptor en 1 punto.
        scorer.punto_para(:receptor)
        # Verifica que el marcador sea "15-15".
        expect(scorer.marcador).to eq("15-15")
      end
    end
  end
  