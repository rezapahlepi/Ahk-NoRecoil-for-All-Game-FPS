; Inisialisasi status awal
bMouseEnabled := true

; Tombol F5 untuk mengaktifkan/menonaktifkan script
F5::
    ToggleMouse()
return

; Tombol F6 sebagai "panic button" untuk keluar dari program
F6::
    ExitApp
return

LButton::
    if (bMouseEnabled) {
        ; Loop akan berlanjut selama tombol mouse kiri ditekan
        while GetKeyState("LButton", "P") {
            MouseMove, 0, 10, 0, R ; Menggerakkan pointer ke bawah sejauh 10 piksel
            Sleep, 10 ; Menunda untuk mencegah loop tak terkendali, bisa disesuaikan
        }
    }
return

ToggleMouse() {
    bMouseEnabled := !bMouseEnabled
    Tooltip, % "Mouse " . (bMouseEnabled ? "Enabled" : "Disabled")
    SetTimer, RemoveTooltip, 1000 ; Menyembunyikan tooltip setelah 1 detik
}

RemoveTooltip:
    Tooltip ; Menampilkan tooltip terakhir
    SetTimer, RemoveTooltip, Off ; Mematikan timer
return
