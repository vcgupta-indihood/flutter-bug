# routeaware

## Reproduce Issue 1:
https://stackoverflow.com/questions/79435280/routeaware-causing-reload-after-upgrade-from-3-13-6-to-3-22

**The route_testing_page rebuilds**
1. Open the app in chrome: `flutter run -d chrome`
2. Go to Route testing
3. tap on lists, it will change the URL on browser containing index
4. In any of index tap 'Show dialog'
5. Check the console logs, it rebuilds everytime we close/open a dialog

Following is `flutter --version` output:
```
Flutter 3.22.3 • channel [user-branch] • unknown source
Framework • revision b0850beeb2 (7 months ago) • 2024-07-16 21:43:41 -0700
Engine • revision 235db911ba
Tools • Dart 3.4.4 • DevTools 2.34.3
```
