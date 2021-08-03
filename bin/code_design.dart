

import 'opp/pk_widget.dart';

void main() {
renderComponet(PkTextWidget());
renderComponet(PkTextButton());
}

dynamic renderComponet(PkWidget pkWidget) {
  return pkWidget.render();
}
