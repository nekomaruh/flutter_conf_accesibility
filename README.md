# Flutter Conf LATAM - Accesibility Workshop

This workshop was presented by Julio Rodriguez. 

NOTE: I modified parts of the UI where I considered that the text looked too small and UI that did not work correctly as expected

Source: https://github.com/Rajual/taller_accesibilidad

Youtube: https://www.youtube.com/watch?v=nkktJanJWDM&t=1295s


# 1. Test Accesibility

This app can be tested with this application in Android

Link: https://play.google.com/store/apps/details?id=com.google.android.apps.accessibility.auditor&hl=es-AR

# 2. Explanation

- Semantics: Is a widget that annotates the widget tree with a description. It is used by accessibility tools, search engines, and other semantic analysis software to determine the meaning of the app.

- Tooltip: Spoken text-to-speech with accessibility through simple tooltips.

- SortKey: Tag to identify the node on which the accessibility talkback execution is currently located. This setting must be mandatory to update the UI of a widget in case it is a constant widget, since if it is not added, talkback will not recognize the widget that is being constantly updated.

- Focusable: If the node is focusable to Talkback.

```
Semantics(
  sortKey: OrdinalSortKey(widgetId),
  focusable: true,
  tooltip: "Text to speech",
  child: Text(
    '$_counter',
    style: Theme.of(context).textTheme.headline4,
  ),
)
```

# 3. Running App

<img width="330" alt="Captura de pantalla 2024-11-02 a la(s) 11 09 38" src="https://github.com/user-attachments/assets/6da22fa0-7244-4dd4-b10d-f457225af4ec">
<img width="330" alt="Captura de pantalla 2024-11-02 a la(s) 11 09 52" src="https://github.com/user-attachments/assets/0e8a4f9a-f30c-4634-990a-0624c4fe7483">


# 4. What I consider is missing?

Although the talk was good, it was focused only on hearing accessibility and internationalization. There are several points where I think accessibility could be added, for example:

- Accessible Controls Support: Button size and spacing, alternative gestures.
- Using shortcuts and alternative navigation: Keyboard navigation, shortcuts and custom actions.
- Haptic Feedback: Vibration.
- Testing: Instrumental testing, widget contrast, text contrast, widget sizes, errors.
