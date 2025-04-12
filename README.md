# 📄 robot-browserstack
Этот проект использует Robot Framework и SeleniumLibrary для автоматизированного тестирования сайта Wikipedia.org.

# Что делает программа:
- Открывает сайт Wikipedia в браузере (Chrome, Firefox, Safari и др.).
- Проверяет главную страницу – наличие элементов и заголовка.
- Выполняет поиск по заданному слову (например, "python").
- Проверяет, что страница содержит результат поиска.
- Делает скриншот страницы.
- Поддерживает запуск в BrowserStack (облачная среда для кроссбраузерного тестирования).
- Может работать через Jenkins для CI/CD.

## Тест 1: Проверка главной страницы Wikipedia
Описание:
- Переходит на главную страницу Wikipedia
- Проверяет, что заголовок страницы — "Wikipedia"
- Убеждается, что выпадающий список выбора языка присутствует на странице

```
Check Wikipedia Homepage
    Add Implicit Wait
    Title Should Be    Wikipedia
    Page Should Contain Element    css:select#searchLanguage
```

## Тест 2: Поиск термина на Wikipedia и проверка результата
Описание:
- Вводит поисковый термин (например, "python")
- Нажимает кнопку поиска
- Ожидает появления результатов
- Проверяет, что искомый термин присутствует на странице
- Делает скриншот страницы

```
Search And Verify Term
    [Arguments]    ${search_term}
    Input Text    id:searchInput    ${search_term}
    Click Button    xpath://button[@type='submit']
    Wait Until Page Contains    ${search_term}    timeout=5s
    Page Should Contain    ${search_term}
    Capture Page Screenshot
```