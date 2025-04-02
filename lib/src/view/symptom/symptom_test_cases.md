# Test Cases for Create Symptom Screen

## Form Validation Tests

### Cage Selection
1. **TC_CS_001: Verify Initial State**
   - **Description**: Verify the initial state of the screen with no cage selected
   - **Steps**:
     1. Navigate to Create Symptom screen
   - **Expected Result**: 
     - "Chọn chuồng báo cáo" shown in cage selection field
     - Submit button disabled
     - Validation message appears indicating cage selection required

2. **TC_CS_002: Cage Selection via List**
   - **Description**: Verify ability to select a cage from the list
   - **Steps**:
     1. Navigate to Create Symptom screen
     2. Tap on cage selection field
     3. Select a cage from list
   - **Expected Result**: 
     - Selected cage name appears in the selection field
     - Continue to show form validation for next required fields

3. **TC_CS_003: Cage Selection via QR Code**
   - **Description**: Verify ability to select a cage via QR code scanning
   - **Steps**:
     1. Navigate to Create Symptom screen
     2. Tap on "Quét QR" button
     3. Scan a valid cage QR code
   - **Expected Result**: 
     - Selected cage name appears in selection field
     - Continue to show form validation for next required fields

4. **TC_CS_004: QR Code Scan Error**
   - **Description**: Verify error handling when scanning invalid QR code
   - **Steps**:
     1. Navigate to Create Symptom screen
     2. Tap on "Quét QR" button
     3. Scan an invalid cage QR code
   - **Expected Result**: 
     - Display error message: "Không tìm thấy thông tin chuồng, hãy thử lại."
     - Return to Create Symptom screen with no cage selected

5. **TC_CS_005: Search for Cage**
   - **Description**: Verify ability to search for a cage in selection sheet
   - **Steps**:
     1. Navigate to Create Symptom screen
     2. Tap on cage selection field
     3. Enter search text in search field
   - **Expected Result**: 
     - Filter results to show only cages matching search criteria
     - Show empty state if no cages match

### Farming Batch Validation

6. **TC_CS_006: No Farming Batch for Cage**
   - **Description**: Verify handling when selected cage has no active farming batch
   - **Steps**:
     1. Navigate to Create Symptom screen
     2. Select a cage with no active farming batch
   - **Expected Result**: 
     - Show error dialog indicating no active farming batch
     - Option to select different cage
     - Submit button remains disabled

7. **TC_CS_007: Farming Batch Loaded Successfully**
   - **Description**: Verify farming batch loads correctly for valid cage
   - **Steps**:
     1. Navigate to Create Symptom screen
     2. Select a cage with active farming batch
   - **Expected Result**: 
     - Farming batch information displayed
     - Available quantity shown correctly 
     - Continue to show form validation for next required fields

### Symptom Selection

8. **TC_CS_008: Symptom Selection**
   - **Description**: Verify ability to select symptoms
   - **Steps**:
     1. Navigate to Create Symptom screen
     2. Select a valid cage
     3. Tap "Thêm triệu chứng" button
     4. Search for symptoms and select multiple options
   - **Expected Result**: 
     - Selected symptoms displayed as chips
     - Continue to show form validation for next required fields

9. **TC_CS_009: Remove Selected Symptom**
   - **Description**: Verify ability to remove a selected symptom
   - **Steps**:
     1. Navigate to Create Symptom screen
     2. Complete steps to select symptoms
     3. Tap remove icon on one symptom chip
   - **Expected Result**: 
     - Selected symptom removed from list
     - Continue to show form validation for next required fields

10. **TC_CS_010: Clear All Symptoms**
    - **Description**: Verify ability to clear all selected symptoms
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete steps to select multiple symptoms
      3. Tap "Xóa tất cả" button
    - **Expected Result**: 
      - All selected symptoms cleared
      - Submit button disabled due to missing symptoms
      - Form validation shows symptom selection required

### Affected Quantity

11. **TC_CS_011: Enter Valid Affected Quantity**
    - **Description**: Verify entering valid quantity of affected animals
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Select a valid cage and symptoms
      3. Enter a quantity within valid range (> 0 and <= available)
    - **Expected Result**: 
      - Entered quantity accepted
      - Form validation for quantity passes
      - Submit button enabled if all other fields valid

12. **TC_CS_012: Enter Zero Affected Quantity**
    - **Description**: Verify validation for zero affected quantity
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Select a valid cage and symptoms
      3. Enter "0" as affected quantity
    - **Expected Result**: 
      - Validation message shows affected quantity required
      - Submit button remains disabled

13. **TC_CS_013: Enter Excessive Affected Quantity**
    - **Description**: Verify validation when affected quantity exceeds available
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Select a valid cage and symptoms
      3. Enter quantity greater than available animals
    - **Expected Result**: 
      - Show warning dialog about exceeding limit
      - Option to set maximum value or reset to zero
      - Form validation fails until corrected

14. **TC_CS_014: Enter High Affected Quantity (>50%)**
    - **Description**: Verify emergency flag when many animals affected
    - **Steps**:
      1. Navigate to Create Symptom screen  
      2. Select a valid cage and symptoms
      3. Enter quantity > 50% of available animals
    - **Expected Result**: 
      - Show emergency confirmation dialog
      - If confirmed, emergency mode activated
      - Submit button requires image attachment

15. **TC_CS_015: Select "All Animals Sick" Option**
    - **Description**: Verify selecting the checkbox for all animals sick
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Select a valid cage and symptoms
      3. Check "Cả đàn đều bị bệnh" checkbox
    - **Expected Result**: 
      - Show emergency confirmation dialog
      - If confirmed, quantity set to maximum available
      - Emergency mode activated
      - Submit button requires image attachment

## Image Attachment Tests

16. **TC_CS_016: Add Photos via Camera**
    - **Description**: Verify adding photos using device camera
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete required fields
      3. Tap image area
      4. Select "Chụp ảnh" option
      5. Take photo and confirm
    - **Expected Result**: 
      - Photo captured and displayed in grid
      - Option to add more photos shown

17. **TC_CS_017: Add Photos from Gallery**
    - **Description**: Verify adding photos from device gallery
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete required fields
      3. Tap image area
      4. Select "Chọn từ thư viện" option
      5. Select photo from gallery
    - **Expected Result**: 
      - Selected photo displayed in grid
      - Option to add more photos shown

18. **TC_CS_018: Remove Added Photo**
    - **Description**: Verify removing a previously added photo
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete required fields and add photos
      3. Tap remove icon on a photo
    - **Expected Result**: 
      - Selected photo removed from grid
      - If in emergency mode and last photo removed, submit button disabled

19. **TC_CS_019: Exceed Maximum Photos Limit**
    - **Description**: Verify maximum photo limit (10) is enforced
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete required fields
      3. Add 10 photos
      4. Try to add another photo
    - **Expected Result**: 
      - Error message: "Bạn chỉ có thể thêm tối đa 10 ảnh."
      - Cannot add more than 10 photos

## Form Submission Tests

20. **TC_CS_020: Submit Valid Form (Non-Emergency)**
    - **Description**: Verify submission with all required fields (non-emergency)
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete all required fields
      3. Add notes (optional)
      4. Add photos (optional)
      5. Tap "Tạo báo cáo" button
      6. Confirm in dialog
    - **Expected Result**: 
      - Show loading indicator during submission
      - On success, navigate to success screen
      - Created symptom data available on success screen

21. **TC_CS_021: Submit Valid Form (Emergency)**
    - **Description**: Verify submission in emergency mode
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete all required fields
      3. Trigger emergency mode (>50% affected)
      4. Add at least one photo (required in emergency)
      5. Tap "Tạo báo cáo" button
      6. Confirm in dialog
    - **Expected Result**: 
      - Show loading indicator during submission
      - On success, navigate to success screen
      - Created symptom data available on success screen with emergency flag

22. **TC_CS_022: Submit in Emergency Mode Without Photos**
    - **Description**: Verify validation when submitting emergency without photos
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete all required fields
      3. Trigger emergency mode
      4. Do not add any photos
      5. Attempt to submit
    - **Expected Result**: 
      - Submit button disabled
      - Form validation shows emergency requires photos

23. **TC_CS_023: Cancel Emergency Mode**
    - **Description**: Verify ability to cancel emergency mode
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete steps to trigger emergency mode
      3. Tap "Hủy" button in emergency banner
    - **Expected Result**: 
      - Emergency mode deactivated
      - Form returns to normal validation rules
      - Photos no longer required for submission

24. **TC_CS_024: Form Submission Error**
    - **Description**: Verify error handling during submission
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete all required fields
      3. Trigger network error during submission
    - **Expected Result**: 
      - Show error message in snackbar
      - Return to form with entered data preserved
      - Submit button re-enabled

## Task-Related Tests

25. **TC_CS_025: Create Symptom from Task**
    - **Description**: Verify creating symptom from task flow
    - **Steps**:
      1. Navigate to Create Symptom from task screen
      2. Verify cage pre-selected
      3. Complete remaining required fields
      4. Submit form
    - **Expected Result**: 
      - Form submits successfully
      - Task marked as "treatment needed"
      - Task log created automatically
      - Return to task screen or success screen

26. **TC_CS_026: Task Status Update After Symptom**
    - **Description**: Verify task status updates correctly
    - **Steps**:
      1. Create symptom from task as in TC_CS_025
      2. Observe task status change
    - **Expected Result**: 
      - Task status updated appropriately
      - Task history reflects symptom creation

## Edge Cases & Error States

27. **TC_CS_027: Handle Network Connection Loss**
    - **Description**: Verify app behavior when network connection lost
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete form
      3. Disable device network
      4. Attempt to submit
    - **Expected Result**: 
      - Show appropriate network error message
      - Form data preserved
      - Option to retry submission

28. **TC_CS_028: Reload Form Data**
    - **Description**: Verify reload button functionality
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Tap refresh button in app bar
    - **Expected Result**: 
      - Show loading indicator
      - Cage list and symptom data refreshed
      - Form fields reset

29. **TC_CS_029: Image Upload Error**
    - **Description**: Verify handling of image upload failure
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Complete form with photos
      3. Trigger image upload error
    - **Expected Result**: 
      - Show error message
      - Option to retry
      - Form data preserved

30. **TC_CS_030: Back Navigation with Unsaved Changes**
    - **Description**: Verify handling of back navigation with unsaved changes
    - **Steps**:
      1. Navigate to Create Symptom screen
      2. Enter partial form data
      3. Attempt to navigate back
    - **Expected Result**: 
      - Show confirmation dialog about unsaved changes
      - Option to discard or continue editing
