# Smart Farm Mobile - Test Cases for User Profile

## 1. User Profile Screen

### 1.1. Loading and Display Tests
- **TC001:** Verify profile information is correctly fetched on screen load
- **TC002:** Verify loading indicator is displayed during data fetching
- **TC003:** Verify correct display of user information after successful data fetch
- **TC004:** Verify error message is displayed when profile fetch fails
- **TC005:** Verify user can retry after a failed fetch

### 1.2. UI Display Tests
- **TC006:** Verify avatar is correctly displayed
- **TC007:** Verify user name field is correctly displayed and disabled
- **TC008:** Verify email field is correctly displayed and disabled
- **TC009:** Verify phone number field is correctly displayed and disabled
- **TC010:** Verify "Cập nhật thông tin" button is present and enabled

### 1.3. Navigation Tests
- **TC011:** Verify back button returns to previous screen
- **TC012:** Verify "Cập nhật thông tin" button navigates to edit profile screen

### 1.4. Refresh Functionality
- **TC013:** Verify pull-to-refresh reloads user profile data
- **TC014:** Verify refresh indicator appears during reload

## 2. Edit User Profile Screen

### 2.1. Loading and Display Tests
- **TC015:** Verify profile data is correctly fetched and displayed on screen load
- **TC016:** Verify loading indicator during data fetch
- **TC017:** Verify error handling for failed data fetch

### 2.2. Form Field Editing Tests
- **TC018:** Verify name field can be edited
- **TC019:** Verify email field can be edited
- **TC020:** Verify phone field can be edited
- **TC021:** Verify all fields properly retain edited values

### 2.3. Change Detection Tests
- **TC022:** Verify _hasChanges flag is false on initial screen load
- **TC023:** Verify _hasChanges becomes true when name field is modified
- **TC024:** Verify _hasChanges becomes true when email field is modified
- **TC025:** Verify _hasChanges becomes true when phone field is modified
- **TC026:** Verify _hasChanges reverts to false after saving changes

### 2.4. Unsaved Changes Warning Tests
- **TC027:** Verify unsaved changes dialog appears when back button is pressed with changes
- **TC028:** Verify navigation is canceled if user selects "Đóng" in unsaved changes dialog
- **TC029:** Verify navigation proceeds if user selects "Xác nhận" in unsaved changes dialog

### 2.5. Avatar Image Selection Tests
- **TC030:** Verify camera avatar button shows bottom sheet with options
- **TC031:** Verify camera option launches device camera and updates avatar
- **TC032:** Verify gallery option opens image picker and updates avatar

### 2.6. Save Functionality Tests
- **TC033:** Verify save button is functional
- **TC034:** Verify save operation successfully persists changes
- **TC035:** Verify _hasChanges is set to false after successful save

### 2.7. Edge Case Tests
- **TC036:** Verify form behavior with empty name field
- **TC037:** Verify form behavior with invalid email format
- **TC038:** Verify form behavior with invalid phone number format
- **TC039:** Verify behavior with excessively long input values

## 3. Integration Tests

### 3.1. Profile Update Flow
- **TC040:** Verify changes made in Edit Profile screen are reflected in User Profile screen
- **TC041:** Verify user profile is updated in the system after save
- **TC042:** Verify user profile persists after application restart
