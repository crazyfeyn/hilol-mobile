import 'package:commerce_mobile/core/services/home_refresh_service.dart';
import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/utils/app_assets.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/language_model.dart';
import 'package:commerce_mobile/presentation/pages/home/home/bloc/home_bloc.dart';
import 'package:commerce_mobile/presentation/widgets/construction_bottom_sheet.dart';
import 'package:commerce_mobile/presentation/widgets/custom_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  final VoidCallback? onTap;

  const LanguageBottomSheet({super.key, this.onTap});

  static showBottomSheet({required BuildContext context, VoidCallback? onTap}) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (_) {
        return LanguageBottomSheet(onTap: onTap);
      },
    );
  }

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  List<LanguageModel> allLanguages = [];
  List<LanguageModel> filteredLanguages = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    allLanguages = LangService.getLanguages();
    filteredLanguages = allLanguages;
    searchController.addListener(_filterLanguages);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterLanguages);
    searchController.dispose();
    super.dispose();
  }

  void _filterLanguages() {
    final query = searchController.text.toLowerCase().trim();
    setState(() {
      if (query.isEmpty) {
        filteredLanguages = allLanguages;
      } else {
        filteredLanguages =
            allLanguages.where((lang) {
              return lang.name.toLowerCase().contains(query) ||
                  lang.languageCode.toLowerCase().contains(query);
            }).toList();
      }
    });
  }

  void _changeLanguage(String selectedLangCode) {
    if (selectedLangCode != context.locale.languageCode) {
      HomeBloc.cachedAllProducts = [];
      HomeBloc.cachedCategories = [];
      LangService.changeLocale(context, selectedLangCode);
      widget.onTap?.call();
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return ConstructionBottomSheet(
      isDivider: false,
      title: "",
      actions: [
        BottomSheetAction(
          color: AppColors.black500,
          icon: AppAssets.icons.icClose,
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
      child: Column(
        children: [
          // Search bar for 29 languages
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: context.tr(LocaleKeys.search_language),
                hintStyle: AppStyles.bodyMDRegular.copyWith(
                  color: AppColors.black400,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.black400,
                  size: 20,
                ),
                filled: true,
                fillColor: AppColors.black50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          // Language list
          SingleChildScrollView(
            child: Column(
              spacing: 12,
              children: List.generate(filteredLanguages.length, (index) {
                final language = filteredLanguages[index];
                final isSelect =
                    language.languageCode == context.locale.languageCode;
                return LanguageCard(
                  isSheet: true,
                  isSelect: isSelect,
                  language: language,
                  onTap: () => _changeLanguage(language.languageCode),
                );
              }),
            ),
          ),
          if (filteredLanguages.isEmpty)
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                context.tr(LocaleKeys.no_language_found),
                style: AppStyles.bodyMDRegular.copyWith(
                  color: AppColors.black400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final bool isSheet;
  final bool isSelect;
  final LanguageModel language;
  final VoidCallback? onTap;

  const LanguageCard({
    super.key,
    this.isSheet = false,
    required this.isSelect,
    required this.language,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: AppColors.black50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side:
              isSheet && isSelect
                  ? BorderSide(width: 1, color: AppColors.primary500)
                  : BorderSide.none,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              spacing: 8,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: CustomSvg(icon: language.icon, size: 24),
                ),
                Expanded(
                  child: Text(language.name, style: AppStyles.bodyMDRegular),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
