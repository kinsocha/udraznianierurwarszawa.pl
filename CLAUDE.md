# udrażnianierurwarszawa.pl – instrukcja projektu

## O projekcie

- **Typ**: pojedynczy statyczny landing HTML (bez frameworka, bez builda). Pliki: `index.html`, `css/style.css`, `img/`.
- **Domena**: udrażnianierurwarszawa.pl (IDN – w systemach: `xn--udranianierurwarszawa-sse.pl`).
- **Repo**: kinsocha/udraznianierurwarszawa.pl.
- **Fraza docelowa**: „udrażnianie rur Warszawa" – cała strona celuje w tę jedną frazę (title: „Udrażnianie Rur Warszawa – Przepychanie Kanalizacji 24h").

## Deploy

- **Automatyczny** – jak w udraznianiekanalizacji.eu: po `git push` na main workflow `.github/workflows/deploy.yml` wysyła wszystkie pliki repo przez FTP na h50.seohost.pl (włączone ponownie 09.08.2026). Sekrety `REMOTE_USER` i `REMOTE_PASSWORD` w ustawieniach repo na GitHubie.
- Workflow NIE wysyła: `.git`, `.github`, `.claude`, `CLAUDE.md`, `.gitignore`, `deploy-lokalny.ps1`, `ftp-haslo.txt`. Nowy plik konfiguracyjny (nieprzeznaczony na serwer) dopisać do wykluczeń w `deploy.yml`.
- `deploy-lokalny.ps1` = tylko ścieżka awaryjna (ręczny wysył 4 plików wpisanych na sztywno; hasło w `ftp-haslo.txt`, którego nie ma w repo). Normalnie nieużywany.

## Twarde reguły

1. **ZERO numeru 510 733 300** (udraznianiekanalizacji.eu) i **ZERO numeru 511 323 123** (i-hydraulik.pl) – nigdzie: ani w treści, ani w schema, ani w draftach. Rozdzielność marek jednego właściciela. Obecnie jedyny kontakt na stronie to e-mail hydraulikwarszawanet@gmail.com – nie dodawać żadnego telefonu bez wyraźnego polecenia.
2. **Nie mieszać marek** – nie przenosić treści, opinii ani elementów z udraznianiekanalizacji.eu, wukowarszawa.pl ani i-hydraulik.pl. Właściciel CELOWO pozycjonuje kilka własnych domen na te same frazy – wymóg to UNIKALNA treść (zero duplicate content między domenami), nie ostrzegać przed samą strategią.
3. **Narracja w 1. osobie liczby pojedynczej** („pracuję", „podaję", „czyszczę") – jednoosobowa działalność, historia 8 lat w MPWiK. Nie zmieniać na „my"/„nasza firma".
4. **Bez nazw dzielnic w mianowniku** w treści – strona celuje w całą Warszawę („Warszawa – wszystkie dzielnice"). Nie wymieniać list dzielnic ani miast.

## Treść – zasady pisania

5. Przed pisaniem JAKIEGOKOLWIEK tekstu (sekcja, FAQ, opinia) przeczytać: `C:\Users\lenovo\Documents\Claude\Projects\Pisanie tekstów\memory.md` (26 reguł stylu) oraz `C:\Users\lenovo\Documents\Claude\Projects\globalne-reguly-pisania-tekstow.md`.
6. Sprężyna elektryczna = wewnątrz budynku; WUKO ciśnieniowo = na zewnątrz (przykanalik, szambo, deszczówka). W tekstach o wnętrzach nie wspominać o WUKO.
7. Inspekcja kamerą: opisywać tylko to, co realnie widać (pęknięcia, wysunięte uszczelki, osad, korzenie, zator). Robimy nagranie i zdjęcia dla klienta – wolno o tym pisać. NIE pisać o diagnostyce spadków ani kamerze obrotowej.
8. Opinie: różna długość, „polecam" w ~2/3, format „Pan/Pani Imię Nazwisko" BEZ dzielnic. Jeśli kiedyś dojdą daty – tylko konkretne dd.mm.rrrr.
9. Zakaz anty-GPT-izmów („warto zaznaczyć", „w dzisiejszych czasach" itd.) i jednostajnego rytmu zdań.

## SEO

10. Schema: `CreativeWorkSeries` + `aggregateRating` (NIE LocalBusiness). Już jest w `<head>` – przy edycji nie zmieniać typu.
11. Sekcja FAQ (`<details><summary>`) MUSI mieć lustrzany blok `FAQPage` JSON-LD – te same pytania i odpowiedzi w obu miejscach. Po każdej edycji FAQ zaktualizować OBA.
12. Body text min 16px na mobile.
13. Cennik jest JAWNY (tabela na stronie) – inaczej niż na udraznianiekanalizacji.eu. Nie ukrywać go.

## Zdjęcia

14. `img/placeholder-hero.svg` i `img/placeholder-autor.svg` to placeholdery do podmiany na prawdziwe zdjęcia (konwersja: Node.js + sharp → .webp jakość ~90). Nazwy plików docelowych ze słowami z tematyki udrażniania (np. `udraznianie-rur-warszawa.webp`), NIE `hydraulik-*`.

## Zachowanie

15. Pytanie ≠ polecenie – na pytania odpowiadać opisem, działać dopiero na wyraźne zlecenie.
16. Po skończonej pracy Claude sam robi `git commit` (bez push) i cytuje treść commita w odpowiedzi.
