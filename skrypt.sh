#!/bin/bash
function show_help(){
    echo "Dostępne opcje:"
    echo "--date (-d)    : wyświetla dzisiejszą datę"
    echo "--logs (-l) [N]: tworzy N plików log (domyślnie 100)"
    echo "--help (-h)    : wyświetla tę pomoc"
    echo "--init         : klonuje repozytorium i ustawia PATH"
    echo "--error (-e) [N]: tworzy N plików error (domyślnie 100)"
}

NUM_FILES=100
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --date|-d)
            date
            exit 0
            ;;
        --logs|-l)
            if [[ "$2" =~ ^[0-9]+$ ]]; then
                NUM_FILES=$2
                shift
            fi
            for i in $(seq 1 $NUM_FILES); do
                echo "log${i}.txt" > "log${i}.txt"
                echo "Skrypt: skrypt.sh" >> "log${i}.txt"
                echo "Data: $(date)" >> "log${i}.txt"
            done
            exit 0
            ;;
        --help|-h)
            show_help
            exit 0
            ;;
        --init)
            git clone https://github.com/WiktoriaKarcz04/cwiczenie_git.git
            export PATH=$PATH:$(pwd)/cwiczenie_git
            exit 0
            ;;
        --error|-e)
            if [[ "$2" =~ ^[0-9]+$ ]]; then
                NUM_FILES=$2
                shift
            fi
            for i in $(seq 1 $NUM_FILES); do
                mkdir -p "error${i}"
                echo "error${i}.txt" > "error${i}/error${i}.txt"
                echo "Skrypt: skrypt.sh" >> "error${i}/error${i}.txt"
                echo "Data: $(date)" >> "error${i}/error${i}.txt"
            done
            exit 0
            ;;
        *)
            echo "Nieznana opcja: $1"
            show_help
            exit 1
            ;;
    esac
    shift
done
