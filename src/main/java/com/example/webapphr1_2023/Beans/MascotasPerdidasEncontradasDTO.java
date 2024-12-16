package com.example.webapphr1_2023.Beans;

public class MascotasPerdidasEncontradasDTO {

        private String periodo;
        private int mascotasPerdidas;
        private int mascotasEncontradas;

        public MascotasPerdidasEncontradasDTO(String periodo, int mascotasPerdidas, int mascotasEncontradas) {
            this.periodo = periodo;
            this.mascotasPerdidas = mascotasPerdidas;
            this.mascotasEncontradas = mascotasEncontradas;
        }

        public String getPeriodo() {
            return periodo;
        }

        public void setPeriodo(String periodo) {
            this.periodo = periodo;
        }

        public int getMascotasPerdidas() {
            return mascotasPerdidas;
        }

        public void setMascotasPerdidas(int mascotasPerdidas) {
            this.mascotasPerdidas = mascotasPerdidas;
        }

        public int getMascotasEncontradas() {
            return mascotasEncontradas;
        }

        public void setMascotasEncontradas(int mascotasEncontradas) {
            this.mascotasEncontradas = mascotasEncontradas;
        }
    }

