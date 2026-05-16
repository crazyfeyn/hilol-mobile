import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/barcode_product_model.dart';
import 'package:commerce_mobile/data/repositories/barcode_repository_impl.dart';
import 'package:commerce_mobile/presentation/pages/barcode/bloc/barcode_bloc.dart';
import 'package:commerce_mobile/presentation/pages/home/details/page/details_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodePage extends StatefulWidget {
  static const String path = "/barcode_page";
  const BarcodePage({super.key});

  @override
  State<BarcodePage> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage>
    with SingleTickerProviderStateMixin {
  final MobileScannerController _scannerController = MobileScannerController();
  bool _scanned = false;
  late final AnimationController _animController;
  late final Animation<double> _scanLineAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _scanLineAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    _scannerController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture, BarcodeBloc bloc) {
    if (_scanned) return;
    final barcode = capture.barcodes.firstOrNull;
    if (barcode?.rawValue == null) return;
    _scanned = true;
    _scannerController.stop();
    bloc.add(BarcodeScanEvent(barcode!.rawValue!));
  }

  void _reset(BarcodeBloc bloc) {
    _scanned = false;
    _scannerController.start();
    bloc.add(BarcodeResetEvent());
  }

  void _showNotFoundSheet(BuildContext ctx, BarcodeBloc bloc) {
    showModalBottomSheet(
      context: ctx,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder:
          (_) => _NotFoundSheet(
            onRescan: () {
              Navigator.of(ctx).pop();
              _reset(bloc);
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BarcodeBloc(barcodeRepository: BarcodeRepositoryImpl()),
      child: Builder(
        builder: (ctx) {
          final bloc = ctx.read<BarcodeBloc>();
          return BlocListener<BarcodeBloc, BarcodeState>(
            listener: (context, state) {
              if (state is BarcodeSuccess) {
                _showResultSheet(context, state.product, bloc);
              } else if (state is BarcodeFailure) {
                _showNotFoundSheet(context, bloc);
              }
            },
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Colors.white,
                title: Text(
                  context.tr(LocaleKeys.scan_barcode),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              body: Stack(
                fit: StackFit.expand,
                children: [
                  MobileScanner(
                    controller: _scannerController,
                    onDetect: (capture) => _onDetect(capture, bloc),
                  ),
                  _ScannerOverlay(scanLineAnim: _scanLineAnim),
                  BlocBuilder<BarcodeBloc, BarcodeState>(
                    builder: (context, state) {
                      if (state is BarcodeLoading) {
                        return const ColoredBox(
                          color: Colors.black38,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  Positioned(
                    bottom: MediaQuery.viewPaddingOf(context).bottom + 48,
                    left: 0,
                    right: 0,
                    child: Text(
                      context.tr(LocaleKeys.point_camera_at_barcode),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black54)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showResultSheet(
    BuildContext ctx,
    BarcodeProductModel product,
    BarcodeBloc bloc,
  ) {
    showModalBottomSheet(
      context: ctx,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      builder:
          (_) => _BarcodeResultSheet(
            product: product,
            onRescan: () {
              Navigator.of(ctx).pop();
              _reset(bloc);
            },
          ),
    );
  }
}

class _BarcodeResultSheet extends StatelessWidget {
  final BarcodeProductModel product;
  final VoidCallback onRescan;

  const _BarcodeResultSheet({required this.product, required this.onRescan});

  @override
  Widget build(BuildContext context) {
    final name = product.localizedName!;
    final status = product.halalStatus ?? '';

    final (statusColor, statusBg, statusLabel, statusIcon) = switch (status) {
      'HALAL' => (
        const Color(0xFF16A34A),
        const Color(0xFFF0FDF4),
        'Halal',
        Icons.verified_rounded,
      ),
      'HARAM' => (
        const Color(0xFFDC2626),
        const Color(0xFFFEF2F2),
        'Haram',
        Icons.cancel_rounded,
      ),
      'SUSPICIOUS' => (
        const Color(0xFFD97706),
        const Color(0xFFFFFBEB),
        'Suspicious',
        Icons.warning_rounded,
      ),
      _ => (
        const Color(0xFF6B7280),
        const Color(0xFFF9FAFB),
        'Not Certified',
        Icons.help_rounded,
      ),
    };

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      builder:
          (_, scrollController) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
              children: [
                // drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Product name
                Text(
                  name.isNotEmpty ? name : product.barcode ?? '',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  product.barcode ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 20),

                // ── Halal status card ──────────────────────────────────────
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: statusBg,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: statusColor.withOpacity(0.25)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(statusIcon, color: statusColor, size: 22),
                          const SizedBox(width: 8),
                          Text(
                            statusLabel,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          if (product.isHalal == true)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF16A34A),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Certified',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (product.reason?.isNotEmpty == true) ...[
                        const SizedBox(height: 10),
                        Text(
                          product.reason!,
                          style: TextStyle(
                            fontSize: 13,
                            color: statusColor,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // ── Ingredients ────────────────────────────────────────────
                if (product.ingredients?.isNotEmpty == true) ...[
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        product.ingredients!
                            .map(
                              (ing) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                child: Text(
                                  ing,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                  const SizedBox(height: 24),
                ],

                // ── Rescan button ──────────────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: onRescan,
                    icon: const Icon(Icons.qr_code_scanner_rounded),
                    label: const Text('Scan Again'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class _ScannerOverlay extends StatelessWidget {
  final Animation<double> scanLineAnim;

  const _ScannerOverlay({required this.scanLineAnim});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final frameSize = size.width * 0.72;
    final frameTop = (size.height - frameSize) / 2.4;

    return Stack(
      children: [
        // dim background
        CustomPaint(
          size: Size(size.width, size.height),
          painter: _DimPainter(
            frameRect: Rect.fromLTWH(
              (size.width - frameSize) / 2,
              frameTop,
              frameSize,
              frameSize,
            ),
          ),
        ),
        // corner brackets + scan line
        Positioned(
          left: (size.width - frameSize) / 2,
          top: frameTop,
          width: frameSize,
          height: frameSize,
          child: Stack(
            children: [
              // corner brackets
              ..._corners(frameSize),
              // animated scan line
              AnimatedBuilder(
                animation: scanLineAnim,
                builder:
                    (_, __) => Positioned(
                      top: scanLineAnim.value * (frameSize - 2),
                      left: 12,
                      right: 12,
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              AppColors.primary600,
                              Colors.transparent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _corners(double size) {
    const len = 28.0;
    const thick = 3.5;
    const color = Colors.white;
    const r = 4.0;

    return [
      // top-left
      Positioned(
        top: 0,
        left: 0,
        child: _Corner(
          len: len,
          thick: thick,
          color: color,
          radius: r,
          top: true,
          left: true,
        ),
      ),
      // top-right
      Positioned(
        top: 0,
        right: 0,
        child: _Corner(
          len: len,
          thick: thick,
          color: color,
          radius: r,
          top: true,
          left: false,
        ),
      ),
      // bottom-left
      Positioned(
        bottom: 0,
        left: 0,
        child: _Corner(
          len: len,
          thick: thick,
          color: color,
          radius: r,
          top: false,
          left: true,
        ),
      ),
      // bottom-right
      Positioned(
        bottom: 0,
        right: 0,
        child: _Corner(
          len: len,
          thick: thick,
          color: color,
          radius: r,
          top: false,
          left: false,
        ),
      ),
    ];
  }
}

class _Corner extends StatelessWidget {
  final double len;
  final double thick;
  final Color color;
  final double radius;
  final bool top;
  final bool left;

  const _Corner({
    required this.len,
    required this.thick,
    required this.color,
    required this.radius,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: len,
      height: len,
      child: CustomPaint(
        painter: _CornerPainter(
          thick: thick,
          color: color,
          radius: radius,
          top: top,
          left: left,
        ),
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  final double thick;
  final Color color;
  final double radius;
  final bool top;
  final bool left;

  _CornerPainter({
    required this.thick,
    required this.color,
    required this.radius,
    required this.top,
    required this.left,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = thick
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    final path = Path();
    final w = size.width;
    final h = size.height;

    if (top && left) {
      path.moveTo(0, h);
      path.lineTo(0, radius);
      path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius));
      path.lineTo(w, 0);
    } else if (top && !left) {
      path.moveTo(0, 0);
      path.lineTo(w - radius, 0);
      path.arcToPoint(Offset(w, radius), radius: Radius.circular(radius));
      path.lineTo(w, h);
    } else if (!top && left) {
      path.moveTo(0, 0);
      path.lineTo(0, h - radius);
      path.arcToPoint(Offset(radius, h), radius: Radius.circular(radius));
      path.lineTo(w, h);
    } else {
      path.moveTo(0, h);
      path.lineTo(w - radius, h);
      path.arcToPoint(Offset(w, h - radius), radius: Radius.circular(radius));
      path.lineTo(w, 0);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CornerPainter old) => false;
}

class _DimPainter extends CustomPainter {
  final Rect frameRect;

  _DimPainter({required this.frameRect});

  @override
  void paint(Canvas canvas, Size size) {
    final full = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(frameRect, const Radius.circular(12));

    final path =
        Path()
          ..addRect(full)
          ..addRRect(rrect)
          ..fillType = PathFillType.evenOdd;

    canvas.drawPath(
      path,
      Paint()..color = Colors.black.withValues(alpha: 0.55),
    );

    // frame border glow
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(_DimPainter old) => old.frameRect != frameRect;
}

class _NotFoundSheet extends StatelessWidget {
  final VoidCallback onRescan;

  const _NotFoundSheet({required this.onRescan});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off_rounded,
              size: 36,
              color: Colors.red.shade400,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.tr(LocaleKeys.product_not_found),
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onRescan,
              icon: const Icon(Icons.qr_code_scanner_rounded),
              label: Text(context.tr(LocaleKeys.rescan)),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.tr(LocaleKeys.cancel_btn)),
            ),
          ),
        ],
      ),
    );
  }
}
