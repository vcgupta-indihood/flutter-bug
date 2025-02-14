# routeaware

## Reproduce Issue 1:
https://stackoverflow.com/questions/79435280/routeaware-causing-reload-after-upgrade-from-3-13-6-to-3-22

**The route_testing_page rebuilds**
1. Open the app in chrome: `flutter run -d chrome`
2. Go to Route testing
3. tap on lists, it will change the URL on browser containing index
4. In any of index tap 'Show dialog'
5. Check the console logs, it rebuilds everytime we close/open a dialog

