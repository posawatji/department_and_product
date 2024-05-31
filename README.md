# Department and Product Project
---
### Project Structure
``` ASCII
📦 lib
┣ 📂 api
┃ ┗ 📂 department_api
┃ ┃ ┣ 📜 get_departments_carousel_list.dart
┃ ┃ ┗ 📜 get_product_list_by_department_id.dart
┣ 📂 config
┃ ┗ 📜 env.dart
┣ 📂 model
┃ ┣ 📂 department_model
┃ ┃ ┗ 📜 department_model.dart
┃ ┗ 📂 product_model
┃ ┃ ┗ 📜 product_model.dart
┣ 📂 provider
┃ ┗ 📜 api_client_provider.dart
┣ 📂 widgets
┃ ┣ 📂 common
┃ ┃ ┣ 📂 dialogs
┃ ┃ ┃ ┗ 📜 product_detail_dialog.dart
┃ ┃ ┣ 📂 error_state
┃ ┃ ┃ ┣ 📜 api_status_code_error_state.dart
┃ ┃ ┃ ┗ 📜 somthing_went_wrong_error_state.dart
┃ ┃ ┗ 📂 widgets
┃ ┃ ┃ ┗ 📜 wrap_with_scroll_bar_for_web.dart
┃ ┗ 📂 page
┃ ┗ 📂 department_and_product_page
┃ ┃ ┣ 📜 department_and_product_page.dart
┃ ┃ ┣ 📜 department_and_product_page.state.dart
┃ ┃ ┣ 📜 department_and_product_page_department_card.dart
┃ ┃ ┣ 📜 department_and_product_page_department_card_carousel_list.dart
┃ ┃ ┣ 📜 department_and_product_page_department_product_card.dart
┃ ┃ ┗ 📜 department_and_product_page_department_product_card_gridview_list.dart
┣ 📜 app.dart
┗ 📜 main.dart
```
