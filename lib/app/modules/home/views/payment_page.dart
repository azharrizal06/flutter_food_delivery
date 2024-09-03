import 'package:flutter/material.dart';
import 'package:food_delivery/app/DataRespon/respon_get_pyment_metode.dart';
import 'package:food_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:food_delivery/app/modules/home/views/order_status_after_payment.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../models/bank_account_model.dart';
import '../widgets/payment_method.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var data = homeController;
    EWallet? ewallet = homeController.paymentMethod;
    final selectedPayment = ValueNotifier<String>("");
    final selectedPaymentBottomSheet = ValueNotifier<String>('');
    final banks = [
      BankAccountModel(
        code: "${ewallet?.idOvo}",
        name: 'OVO',
        image: Assets.images.payments.ovo.path,
      ),
      BankAccountModel(
        code: "${ewallet?.idDana}",
        name: 'DANA',
        image: Assets.images.payments.dana.path,
      ),
      BankAccountModel(
        code: "${ewallet?.idLinkaja}",
        name: 'LinkAja',
        image: Assets.images.payments.linkAja.path,
      ),
      BankAccountModel(
        code: "${ewallet?.idShopeepay}",
        name: 'Shopee Pay',
        image: Assets.images.payments.shopeePay.path,
      ),
    ];

    List<BankAccountModel> banksLimit = [banks[0], banks[1]];

    void seeAllTap() async {
      await homeController.getPaymentMethod();
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (BuildContext context) {
          selectedPaymentBottomSheet.value;
          BankAccountModel? bankSelected;
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: ColoredBox(
                    color: AppColors.background,
                    child: SizedBox(height: 8.0, width: 55.0),
                  ),
                ),
                const SpaceHeight(20.0),
                const Text(
                  'Metode Pembayaran',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(16.0),
                ValueListenableBuilder(
                  valueListenable: selectedPaymentBottomSheet,
                  builder: (context, value, _) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => PaymentMethod(
                      isActive: value == banks[index].code,
                      data: banks[index],
                      onTap: () {
                        selectedPaymentBottomSheet.value = banks[index].code;
                        bankSelected = banks[index];
                        print(selectedPaymentBottomSheet.value.toString());
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(14.0),
                    itemCount: banks.length,
                  ),
                ),
                const SpaceHeight(34.0),
                Button.filled(
                  onPressed: () {
                    if (bankSelected != null) {
                      selectedPayment.value = bankSelected!.code;
                      if (banksLimit.first != bankSelected!) {
                        banksLimit[1] = bankSelected!;
                      }
                    }
                    selectedPaymentBottomSheet.value;
                    context.pop();
                  },
                  label: 'Konfirmasi',
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Row(
            children: [
              const Text(
                'Pilih Metode Pembayaran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: seeAllTap,
                // onTap: () => homeController.getPaymentMethod(),
                child: const Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SpaceHeight(14.0),
          ValueListenableBuilder(
            valueListenable: selectedPayment,
            builder: (context, value, _) => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => PaymentMethod(
                  isActive: value == banksLimit[index].code,
                  data: banksLimit[index],
                  onTap: () {
                    selectedPayment.value = banksLimit[index].code;
                    print("${selectedPayment.value}");
                  }),
              separatorBuilder: (context, index) => const SpaceHeight(14.0),
              itemCount: banksLimit.length,
            ),
          ),
          const SpaceHeight(50.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: AppColors.stroke),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ringkasan Pembayaran',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(16.0),
                Row(
                  children: [
                    const Text(
                      'Total Belanja',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray3,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      data.total.value.currencyFormatRp,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray3,
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(8.0),
                Row(
                  children: [
                    const Text(
                      'Biaya Pengiriman',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray3,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      data.ongkos.value.currencyFormatRp,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray3,
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(16.0),
                const DottedDivider(
                  color: AppColors.gray1,
                  dashWidth: 4,
                ),
                const SpaceHeight(16.0),
                Row(
                  children: [
                    const Text(
                      'Total Tagihan',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      (data.total.value + data.ongkos.value)!.currencyFormatRp,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder(
          valueListenable: selectedPayment,
          builder: (context, value, _) => Button.filled(
            disabled: value == 0,
            onPressed: () async {
              data.pesan_sekarang(selectedPayment.value).then((value) async {
                if (value != null) {
                  context.showDialogSuccess(
                      'Pembayaran Berhasil', 'Pesanan anda sedang diproses');
                  await Future.delayed(const Duration(seconds: 2));
                  if (context.mounted) {
                    context.popToRoot();
                    context.push(const OrderStatusAfterPayment());
                  }
                } else {
                  context.showDialogError('Pembayaran Gagal',
                      'Ops. Terjadi kesalahan, mohon ulangi sesaat lagi ya, Sob.');
                  await Future.delayed(const Duration(seconds: 2));
                }
              });
            },
            label: 'Bayar Sekarang',
          ),
        ),
      ),
    );
  }
}
