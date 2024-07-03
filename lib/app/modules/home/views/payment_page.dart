import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/bank_account_model.dart';
import '../widgets/payment_method.dart';
import 'order_status_after_payment.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPayment = ValueNotifier<int>(0);
    final selectedPaymentBottomSheet = ValueNotifier<int>(0);
    final banks = [
      BankAccountModel(
        code: 110,
        name: 'OVO',
        image: Assets.images.payments.ovo.path,
      ),
      BankAccountModel(
        code: 111,
        name: 'DANA',
        image: Assets.images.payments.dana.path,
      ),
      BankAccountModel(
        code: 112,
        name: 'LinkAja',
        image: Assets.images.payments.linkAja.path,
      ),
      BankAccountModel(
        code: 113,
        name: 'Shopee Pay',
        image: Assets.images.payments.shopeePay.path,
      ),
    ];

    List<BankAccountModel> banksLimit = [banks[0], banks[1]];

    void seeAllTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (BuildContext context) {
          selectedPaymentBottomSheet.value = 0;
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
                    selectedPaymentBottomSheet.value = 0;
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
                onTap: () => selectedPayment.value = banksLimit[index].code,
              ),
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
                      375000.currencyFormatRp,
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
                      2000.currencyFormatRp,
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
                      377000.currencyFormatRp,
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
              context.showDialogSuccess('Pembayaran Berhasil',
                  'Pesanan kamu akan segera ditinjau dan diproses oleh kami ya, tunggu notifikasi selanjutnya.');
              // context.showDialogError('Pembayaran Gagal',
              //     'Ops. Terjadi kesalahan, mohon ulangi sesaat lagi ya, Sob.');
              await Future.delayed(const Duration(seconds: 2));
              if (context.mounted) {
                context.popToRoot();
                context.push(const OrderStatusAfterPayment());
              }
            },
            label: 'Bayar Sekarang',
          ),
        ),
      ),
    );
  }
}
