import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/voice_assist_button.dart';
import 'package:ondc_seller_onboarding/screens/step_container.dart';
import '../config/theme.dart';
import 'package:ondc_seller_onboarding/screens/dashboard_screen.dart';

class StoreDetailsScreen extends StatelessWidget {
  final controller = Get.put(OnboardingController());
   final TextEditingController storeNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Clear input fields when step changes
    ever(controller.currentStep, (_) {
      storeNameController.clear();
      ownerNameController.clear();
      phoneController.clear();
      gstController.clear();
      addressController.clear();
    });

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              _buildHeader(),
              _buildProgressIndicator(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: _buildCurrentStepContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
          SizedBox(width: 16),
          Text(
            'store_details.title'.tr,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Step ${controller.currentStep.value} of 6',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${(int.parse(controller.currentStep.value) * 100 / 6).toInt()}%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: 8,
                width: Get.width * (int.parse(controller.currentStep.value) / 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentStepContent() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: _getStepWidget(),
    );
  }

  Widget _getStepWidget() {
    switch (controller.currentStep.value) {
      case '1':
        return _buildStoreNameStep();
      case '2':
        return _buildOwnerNameStep();
      case '3':
        return _buildPhoneStep();
      case '4':
        return _buildGSTStep();
      case '5':
        return _buildAddressStep();
      case '6':
        return _buildBusinessTypeStep();
      default:
        return Container();
    }
  }

  Widget _buildStepContainer({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.tr,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            subtitle.tr,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24),
          child,
          SizedBox(height: 24),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      if (controller.currentStep.value != '1')
        ElevatedButton.icon(
          onPressed: () => controller.moveToPreviousStep(),
          icon: Icon(Icons.arrow_back),
          label: Text('common.back'.tr),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black87,
          ),
        ),
      if (controller.currentStep.value != '5') // Stop at address step
        ElevatedButton.icon(
          onPressed: () => controller.moveToNextStep(),
          icon: Icon(Icons.arrow_forward),
          label: Text('common.next'.tr),
        ),
    ],
    );
  }

 

   Widget _buildInputContainer({
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.tr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 24),
          child,
          SizedBox(height: 24),
          _buildNavigationButtons(),
        ],
      ),
    );
  }


  Widget _buildStoreNameStep() {
    return _buildInputContainer(
      title: 'store_details.store_name',
      child: TextFormField(
        controller: storeNameController,
        decoration: InputDecoration(
          hintText: 'store_details.store_name_hint'.tr,
          prefixIcon: Icon(Icons.store),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Color(0xFFF8F9FA),
        ),
        onChanged: (value) => controller.updateStoreData('storeName', value),
      ),
    );
  }
  Widget _buildGSTStep() {
    return StepContainer(
      titleKey: 'store_details.gst',
      child: Column(
        children: [
          TextFormField(
            controller: gstController,
            decoration: InputDecoration(
              hintText: 'store_details.gst_hint'.tr,
              prefixIcon: Icon(Icons.receipt),
              border: OutlineInputBorder(),
            ),
            textCapitalization: TextCapitalization.characters,
            maxLength: 15,
            onChanged: (value) => controller.updateStoreData('gst', value.toUpperCase()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'store_details.gst_required'.tr;
              }
              final gstRegex = RegExp(r'^\d{2}[A-Z]{5}\d{4}[A-Z]{1}\d{1}[Z]{1}[A-Z\d]{1}$');
              if (!gstRegex.hasMatch(value)) {
                return 'store_details.invalid_gst'.tr;
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          _buildNavigationButtons(),
        ],
      ),
    );
  }
  

  Widget _buildOwnerNameStep() {
    return StepContainer(
      titleKey: 'store_details.owner_name',
      child: Column(
        children: [
          TextFormField(
            controller: ownerNameController,
            decoration: InputDecoration(
              hintText: 'store_details.owner_name_hint'.tr,
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => controller.updateStoreData('ownerName', value),
          ),
          SizedBox(height: 16),
          _buildNavigationButtons(),
        ],
      ),
    );
  }
  Widget _buildPhoneStep() {
    return StepContainer(
      titleKey: 'store_details.phone',
      child: Column(
        children: [
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'store_details.phone_hint'.tr,
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => controller.updateStoreData('phone', value),
          ),
          SizedBox(height: 16),
          _buildNavigationButtons(),
        ],
      ),
    );
  }
bool _validateAddress() {
  final address = controller.storeData['address'] ?? '';
  return address.trim().length >= 10; // Minimum 10 characters for address
}
void _navigateToDashboard() {
  // Show success dialog
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.successColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                color: AppTheme.successColor,
                size: 48,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.successColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Your store has been registered successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => DashboardScreen());  // Navigate to dashboard
                },
                child: Text('Go to Dashboard'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.successColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

  Widget _buildAddressStep() {
    return _buildStepContainer(
      title: 'store_details.address',
      // subtitle: 'store_details.address_subtitle'.tr,
      subtitle: '',
      child: Column(
        children: [
          TextFormField(
            controller: addressController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'store_details.address_hint'.tr,
              prefixIcon: Icon(Icons.location_on),
            ),
            onChanged: (value) => controller.updateStoreData('address', value),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                if (_validateAddress()) {
                  _navigateToDashboard();
                } else {
                  Get.snackbar(
                    'Error',
                    'Please enter a valid address',
                    backgroundColor: Colors.red[100],
                    colorText: Colors.red[900],
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              icon: Icon(Icons.check),
              label: Text('common.finish'.tr),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.successColor,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessTypeStep() {
  final businessTypes = [
    'business.kirana',
    'business.grocery',
    'business.pharmacy',
    'business.clothing',
    'business.electronics',
    'business.other',
  ];

  return _buildStepContainer(
    title: 'business.type',
    subtitle: 'business.type_subtitle'.tr,
    child: Column(
      children: [
        ...businessTypes.map((type) => Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(12),
          ),
          child: RadioListTile<String>(
            title: Text(type.tr),
            value: type,
            groupValue: controller.storeData['businessType'],
            onChanged: (value) => controller.updateStoreData('businessType', value!),
            activeColor: AppTheme.primaryColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        )),
        SizedBox(height: 16),
        _buildNavigationButtons(),
      ],
    ),
  );
}

  

  Widget _buildErrorMessage() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              controller.errorMessage.value,
              style: TextStyle(color: Colors.red[900]),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmit() {
    if (_validateFields()) {
      _submitData();
    } else {
      controller.speak('store_details.missing_fields'.tr);
    }
  }

  bool _validateFields() {
    final requiredFields = ['storeName', 'ownerName', 'phone', 'address', 'businessType'];
    return requiredFields.every((field) => 
      controller.storeData[field]?.isNotEmpty ?? false);
  }

  void _submitData() {
    Get.dialog(
      AlertDialog(
        title: Text('common.success'.tr),
        content: Text('store_details.submission_success'.tr),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              // Navigate to the next screen (e.g., dashboard)
              // Get.offAll(() => DashboardScreen());
            },
            child: Text('common.done'.tr),
          ),
        ],
      ),
    );
  }
}