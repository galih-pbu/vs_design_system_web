import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

/// Comprehensive examples for VSIcon widget
class VSIconExample extends StatefulWidget {
  const VSIconExample({super.key});

  @override
  State<VSIconExample> createState() => _VSIconExampleState();
}

class _VSIconExampleState extends State<VSIconExample> {
  Widget buildSection({required String title, required List<Widget> children}) {
    return ListView(
      padding: EdgeInsets.only(top: 24, left: 24, right: 24),
      children: [
        Text(title, style: AppTypography.h5),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget buildSubsection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.bodyMediumSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(spacing: 12, runSpacing: 12, children: children),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Icon Examples',
      //   variant: VSAppBarVariant.main,
      // ),
      body: buildSection(
        title: 'VS Icon Examples',
        children: [
          buildSubsection(
            title: 'Basic Usage - Default Size (24px)',
            children: [
              Row(
                children: [
                  VSIcon(name: VSIcons.eye),
                  const SizedBox(width: 16),
                  VSIcon(name: VSIcons.heart),
                  const SizedBox(width: 16),
                  VSIcon(name: VSIcons.searchSm),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Basic Usage - Custom Sizes',
            children: [
              Row(
                children: [
                  VSIcon(name: VSIcons.starShape, size: 16),
                  const SizedBox(width: 16),
                  VSIcon(name: VSIcons.starShape, size: 24),
                  const SizedBox(width: 16),
                  VSIcon(name: VSIcons.starShape, size: 32),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Icon Colors - Primary Colors',
            children: [
              Row(
                children: [
                  VSIcon(name: VSIcons.check, color: AppColors.primaryDefault),
                  const SizedBox(width: 16),
                  VSIcon(
                    name: VSIcons.alertTriangle,
                    color: AppColors.dangerDefault,
                  ),
                  const SizedBox(width: 16),
                  VSIcon(
                    name: VSIcons.checkCircle,
                    color: AppColors.successDefault,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Icon Colors - Neutral Colors',
            children: [
              Row(
                children: [
                  VSIcon(name: VSIcons.settings, color: AppColors.neutral600),
                  const SizedBox(width: 16),
                  VSIcon(name: VSIcons.user, color: AppColors.neutral700),
                  const SizedBox(width: 16),
                  VSIcon(name: VSIcons.clock, color: AppColors.neutral500),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Section Divider
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.neutral300, thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Icon Categories',
                    style: AppTypography.bodyMediumSemibold.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(color: AppColors.neutral300, thickness: 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'General Icons (193 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.home),
                  VSIcon(name: VSIcons.settings),
                  VSIcon(name: VSIcons.bell),
                  VSIcon(name: VSIcons.filterFunnel),
                  VSIcon(name: VSIcons.menu),
                  VSIcon(name: VSIcons.zap),
                  VSIcon(name: VSIcons.zapCircle),
                  VSIcon(name: VSIcons.activity),
                  VSIcon(name: VSIcons.activityHeart),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Communication (58 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.mail),
                  VSIcon(name: VSIcons.message),
                  VSIcon(name: VSIcons.send),
                  VSIcon(name: VSIcons.phone),
                  VSIcon(name: VSIcons.phoneCall),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Files & Folders (57 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.file),
                  VSIcon(name: VSIcons.folder),
                  VSIcon(name: VSIcons.filePlus),
                  VSIcon(name: VSIcons.fileCheck),
                  VSIcon(name: VSIcons.download),
                  VSIcon(name: VSIcons.upload),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Arrows & Navigation (92 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.arrowUp),
                  VSIcon(name: VSIcons.arrowDown),
                  VSIcon(name: VSIcons.arrowLeft),
                  VSIcon(name: VSIcons.arrowRight),
                  VSIcon(name: VSIcons.chevronUp),
                  VSIcon(name: VSIcons.chevronDown),
                  VSIcon(name: VSIcons.clockRefresh),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Editor Tools (104 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.edit),
                  VSIcon(name: VSIcons.bold),
                  VSIcon(name: VSIcons.italic),
                  VSIcon(name: VSIcons.alignLeft),
                  VSIcon(name: VSIcons.alignCenter),
                  VSIcon(name: VSIcons.alignRight),
                  VSIcon(name: VSIcons.type),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Media & Devices (108 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.play),
                  VSIcon(name: VSIcons.pauseCircle),
                  VSIcon(name: VSIcons.volumeMax),
                  VSIcon(name: VSIcons.microphone),
                  VSIcon(name: VSIcons.webcam),
                  VSIcon(name: VSIcons.monitor),
                  VSIcon(name: VSIcons.phoneDevice),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Security (36 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.lock),
                  VSIcon(name: VSIcons.lockUnlocked),
                  VSIcon(name: VSIcons.shield),
                  VSIcon(name: VSIcons.key),
                  VSIcon(name: VSIcons.fingerprint),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Finance (79 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.creditCard),
                  VSIcon(name: VSIcons.shoppingCart),
                  VSIcon(name: VSIcons.bank),
                  VSIcon(name: VSIcons.currencyDollar),
                  VSIcon(name: VSIcons.wallet),
                  VSIcon(name: VSIcons.coins),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Weather (52 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.sun),
                  VSIcon(name: VSIcons.cloud),
                  VSIcon(name: VSIcons.cloudRain),
                  VSIcon(name: VSIcons.moon),
                  VSIcon(name: VSIcons.snowflake),
                  VSIcon(name: VSIcons.wind),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Maps & Travel (45 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.map),
                  VSIcon(name: VSIcons.markerPin),
                  VSIcon(name: VSIcons.plane),
                  VSIcon(name: VSIcons.car),
                  VSIcon(name: VSIcons.bus),
                  VSIcon(name: VSIcons.flag),
                  VSIcon(name: VSIcons.globe),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Time & Calendar (28 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.clock),
                  VSIcon(name: VSIcons.calendar),
                  VSIcon(name: VSIcons.hourglass),
                  VSIcon(name: VSIcons.alarmClock),
                  VSIcon(name: VSIcons.watch),
                  VSIcon(name: VSIcons.calendarCheck),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Education (31 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.bookOpen),
                  VSIcon(name: VSIcons.graduationHat),
                  VSIcon(name: VSIcons.atom),
                  VSIcon(name: VSIcons.award),
                  VSIcon(name: VSIcons.calculator),
                  VSIcon(name: VSIcons.microscope),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Charts & Analytics (49 icons)',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: VSIcons.barChart),
                  VSIcon(name: VSIcons.pieChart),
                  VSIcon(name: VSIcons.lineChartUp),
                  VSIcon(name: VSIcons.trendUp),
                  VSIcon(name: VSIcons.presentationChart),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Section Divider
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.neutral300, thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Interactive Examples',
                    style: AppTypography.bodyMediumSemibold.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(color: AppColors.neutral300, thickness: 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'Interactive Examples - Toggle States',
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => VSToastService.showToast(
                      context,
                      title: 'Eye Icon',
                      description: 'Eye icon clicked!',
                      type: VSToastType.info,
                    ),
                    icon: VSIcon(name: VSIcons.eye),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () => VSToastService.showToast(
                      context,
                      title: 'Heart Icon',
                      description: 'Heart icon clicked!',
                      type: VSToastType.success,
                    ),
                    icon: VSIcon(
                      name: VSIcons.heart,
                      color: AppColors.dangerDefault,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () => VSToastService.showToast(
                      context,
                      title: 'Star Icon',
                      description: 'Star icon clicked!',
                      type: VSToastType.warning,
                    ),
                    icon: VSIcon(
                      name: VSIcons.starShape,
                      color: AppColors.warningDefault,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Custom Icon Paths - Direct Path Usage',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSIcon(name: 'general/eye'),
                  VSIcon(name: 'arrows/arrow-up'),
                  VSIcon(name: 'communication/mail-01'),
                  VSIcon(name: 'files/file-01'),
                  VSIcon(name: 'users/user-01'),
                  VSIcon(name: 'editor/edit-01'),
                  VSIcon(name: 'mapsandtravel/plane'),
                  VSIcon(name: 'weather/sun'),
                  VSIcon(name: 'education/book-open-01'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Custom Icon Paths - With Custom Styling',
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: VSIcon(
                      name: VSIcons.check,
                      color: AppColors.primaryDefault,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.successBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: VSIcon(
                      name: VSIcons.checkCircle,
                      color: AppColors.successDefault,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Section Divider
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.neutral300, thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'VS Components Integration',
                    style: AppTypography.bodyMediumSemibold.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(color: AppColors.neutral300, thickness: 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'Icons with VS Components - VSButton',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  SizedBox(
                    width: 200,
                    child: VSButton(
                      label: 'Save',
                      onPressed: () {},
                      leftIcon: Icons.save,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: VSButton(
                      label: 'Delete',
                      onPressed: () {},
                      leftIcon: Icons.delete,
                      variant: VSButtonVariant.danger,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: VSButton(
                      label: 'Share',
                      onPressed: () {},
                      rightIcon: Icons.share,
                      variant: VSButtonVariant.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Icons with VS Components - VSBadge',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSBadge(
                    label: 'Active',
                    icon: Icons.check_circle,
                    variant: VSBadgeVariant.success,
                  ),
                  VSBadge(
                    label: 'Warning',
                    icon: Icons.warning,
                    variant: VSBadgeVariant.warning,
                  ),
                  VSBadge(
                    label: 'Error',
                    icon: Icons.error,
                    variant: VSBadgeVariant.danger,
                  ),
                  VSBadge(
                    label: 'Info',
                    icon: Icons.info,
                    variant: VSBadgeVariant.primary,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Icons with VS Components - VSChip',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  VSChip(label: 'Tag', onDelete: () {}),
                  VSChip(
                    label: 'Filter',
                    variant: VSChipVariant.secondary,
                    onDelete: () {},
                  ),
                  VSChip(
                    label: 'Selected',
                    variant: VSChipVariant.primary,
                    showCheckIndicator: true,
                    type: VSChipType.approval,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Custom Buttons with VSIcon',
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  // Custom button with VSIcon
                  GestureDetector(
                    onTap: () => VSToastService.showToast(
                      context,
                      title: 'Custom Button',
                      description: 'VSIcon in custom button!',
                      type: VSToastType.info,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDefault,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VSIcon(
                            name: VSIcons.plus,
                            color: AppColors.neutral0,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Add Item',
                            style: AppTypography.bodyMediumRegular.copyWith(
                              color: AppColors.neutral0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Icon-only button
                  GestureDetector(
                    onTap: () => VSToastService.showToast(
                      context,
                      title: 'Icon Button',
                      description: 'VSIcon only button!',
                      type: VSToastType.success,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.successBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.successDefault),
                      ),
                      child: VSIcon(
                        name: VSIcons.check,
                        color: AppColors.successDefault,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSubsection(
            title: 'Icons in Complex Layouts',
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.neutral200),
                ),
                child: Column(
                  children: [
                    // Header with icon
                    Row(
                      children: [
                        VSIcon(
                          name: VSIcons.user,
                          color: AppColors.primaryDefault,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text('User Profile', style: AppTypography.h6),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Action buttons with icons
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: AppColors.primaryDefault,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VSIcon(
                                    name: VSIcons.mail,
                                    color: AppColors.neutral0,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Message',
                                    style: AppTypography.bodySmallRegular
                                        .copyWith(color: AppColors.neutral0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: AppColors.neutral0,
                                border: Border.all(color: AppColors.neutral300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VSIcon(
                                    name: VSIcons.phone,
                                    color: AppColors.primaryDefault,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Call',
                                    style: AppTypography.bodySmallRegular
                                        .copyWith(
                                          color: AppColors.primaryDefault,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Section Divider
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.neutral300, thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Complete Icon Reference',
                    style: AppTypography.bodyMediumSemibold.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(color: AppColors.neutral300, thickness: 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'All Available Icon Names by Category',
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.neutral200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'General Icons (193 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'activity, activityHeart, alertCircle, alertTriangle, archive, arrowDown, arrowLeft, arrowRight, arrowUp, atSign, award, back, ban, barChart, bell, bellOff, bellRing, bookmark, bookmarkCheck, bookmarkMinus, bookmarkPlus, bookmarkX, briefcase, building, building2, calendar, calendarCheck, calendarDays, calendarHeart, calendarMinus, calendarPlus, calendarRange, calendarX, camera, cast, check, checkCheck, checkCircle, checkSquare, chevronDown, chevronLeft, chevronRight, chevronUp, chevronsDown, chevronsLeft, chevronsRight, chevronsUp, circle, circleDot, circleEllipsis, circleHelp, circleX, clipboard, clipboardCheck, clipboardCopy, clipboardEdit, clipboardList, clipboardSignature, clipboardType, clipboardX, clock, clock1, clock10, clock11, clock12, clock2, clock3, clock4, clock5, clock6, clock7, clock8, clock9, cloud, cloudDrizzle, cloudFog, cloudHail, cloudLightning, cloudMoon, cloudOff, cloudRain, cloudRainWind, cloudSnow, cloudSun, code, code2, codeSquare, codesandbox, coffee, command, compass, copy, copyCheck, copyMinus, copyPlus, copyX, cornerDownLeft, cornerDownRight, cornerLeftDown, cornerLeftUp, cornerRightDown, cornerRightUp, cornerUpLeft, cornerUpRight, cpu, creditCard, crop, crosshair, database, delete, disc, divide, divideCircle, divideSquare, dollarSign, download, downloadCloud, droplet, edit, edit2, edit3, equal, equalNot, expand, externalLink, eye, eyeOff, fastForward, feather, file, fileAudio, fileImage, fileText, fileVideo, fileX, film, filter, flag, flagTriangleLeft, flagTriangleRight, flame, flashlight, flashlightOff, folder, folderMinus, folderOpen, folderPlus, forward, frown, functionSquare, gamepad, gamepad2, gauge, gift, gitBranch, gitBranchPlus, gitCommit, gitCompare, gitFork, gitMerge, gitPullRequest, github, gitlab, globe, grid, grid3x3, hardDrive, hardHat, hash, headphones, headphonesOff, heart, helpCircle, hexagon, home, image, imageMinus, imageOff, imagePlus, inbox, info, italic, key, landmark, languages, laptop, laptop2, layers, layout, layoutDashboard, layoutGrid, layoutList, layoutTemplate, lifeBuoy, lightbulb, lightbulbOff, link, link2, list, listChecks, listMinus, listMusic, listOrdered, listPlus, listVideo, listX, loader, loader2, locate, locateFixed, locateOff, lock, logIn, logOut, mail, map, mapPin, mapPinOff, maximize, maximize2, megaphone, menu, messageCircle, messageSquare, mic, micOff, microphone, microphone2, minimize, minimize2, minus, minusCircle, minusSquare, monitor, monitorOff, monitorSpeaker, moon, moreHorizontal, moreVertical, mouse, mousePointer, move, move3d, moveDiagonal, moveDiagonal2, moveHorizontal, moveVertical, music, navigation, navigation2, octagon, package, package2, packageCheck, packageMinus, packageOpen, packagePlus, packageSearch, packageX, palette, paperclip, pause, pauseCircle, penTool, percent, phone, phoneCall, phoneForwarded, phoneIncoming, phoneMissed, phoneOff, phoneOutgoing, pieChart, pin, pinOff, play, playCircle, plus, plusCircle, plusSquare, pocket, power, powerOff, printer, radio, refreshCcw, refreshCw, repeat, repeat1, rewind, rotateCcw, rotateCw, rss, save, scissors, search, send, server, serverCog, serverCrash, serverOff, settings, settings2, share, share2, sheet, shield, shieldAlert, shieldCheck, shieldClose, shieldOff, shieldX, shoppingBag, shoppingCart, shuffle, sidebar, sidebarClose, sidebarOpen, skipBack, skipForward, slack, slash, sliders, smartphone, smile, speaker, square, star, starHalf, starOff, stopCircle, sun, sunrise, sunset, tablet, tag, target, terminal, thermometer, thumbsDown, thumbsUp, toggleLeft, toggleRight, tool, trash, trash2, trendingDown, trendingUp, triangle, truck, tv, tv2, type, umbrella, underline, unlock, upload, uploadCloud, user, userCheck, userCog, userMinus, userPlus, userX, users, video, videoOff, voicemail, volume, volume1, volume2, volumeX, wallet, wand, wand2, watch, wifi, wifiOff, wind, wrench, x, xCircle, xOctagon, xSquare, zap, zapOff, zoomIn, zoomOut',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Communication (58 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'atSign, hash, mail, mailCheck, mailMinus, mailOpen, mailPlus, mailQuestion, mailSearch, mailWarning, mailX, messageCircle, messageSquare, messageSquareDashed, messageSquarePlus, messageSquareX, phone, phoneCall, phoneForwarded, phoneIncoming, phoneMissed, phoneOff, phoneOutgoing, radio, rss, send, share, share2, slack, voicemail',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Files & Folders (57 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'archive, file, fileArchive, fileAudio, fileCheck, fileClock, fileCode, fileCode2, fileCog, fileDiff, fileDigit, fileDown, fileEdit, fileHeart, fileImage, fileInput, fileLock, fileMinus, fileOutput, filePlus, fileQuestion, fileScan, fileSearch, fileShield, fileSpreadsheet, fileSymlink, fileTerminal, fileText, fileType, fileType2, fileUp, fileVideo, fileWarning, fileX, folder, folderArchive, folderCheck, folderClock, folderClosed, folderCog, folderDot, folderDown, folderEdit, folderGit, folderGit2, folderHeart, folderInput, folderKanban, folderKey, folderLock, folderMinus, folderOpen, folderOutput, folderPlus, folderRoot, folderSearch, folderSymlink, folderSync, folderTree, folderUp, folderX',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Arrows & Navigation (92 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'arrowBigDown, arrowBigLeft, arrowBigRight, arrowBigUp, arrowDown, arrowDown01, arrowDown10, arrowDownAZ, arrowDownCircle, arrowDownFromLine, arrowDownLeft, arrowDownLeftFromCircle, arrowDownLeftSquare, arrowDownNarrowWide, arrowDownRight, arrowDownRightFromCircle, arrowDownRightSquare, arrowDownSquare, arrowDownToDot, arrowDownToLine, arrowDownUp, arrowDownWideNarrow, arrowDownZA, arrowLeft, arrowLeftCircle, arrowLeftFromLine, arrowLeftRight, arrowLeftSquare, arrowLeftToLine, arrowRight, arrowRightCircle, arrowRightFromLine, arrowRightLeft, arrowRightSquare, arrowRightToLine, arrowUp, arrowUp01, arrowUp10, arrowUpAZ, arrowUpCircle, arrowUpDown, arrowUpFromLine, arrowUpLeft, arrowUpLeftFromCircle, arrowUpLeftSquare, arrowUpNarrowWide, arrowUpRight, arrowUpRightFromCircle, arrowUpRightSquare, arrowUpSquare, arrowUpToLine, arrowUpWideNarrow, arrowUpZA, arrowsUpFromLine, chevronDown, chevronFirst, chevronLast, chevronLeft, chevronRight, chevronUp, chevronsDown, chevronsLeft, chevronsLeftRight, chevronsRight, chevronsUp, chevronsUpDown, cornerDownLeft, cornerDownRight, cornerLeftDown, cornerLeftUp, cornerRightDown, cornerRightUp, cornerUpLeft, cornerUpRight, move, move3d, moveDiagonal, moveDiagonal2, moveDown, moveDownLeft, moveDownRight, moveHorizontal, moveLeft, moveRight, moveUp, moveUpLeft, moveUpRight, moveVertical',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Editor Tools (104 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'alignCenter, alignJustify, alignLeft, alignRight, alignVerticalCenter, alignVerticalDistribute, alignVerticalJustify, alignVerticalSpaceAround, alignVerticalSpaceBetween, alignVerticalStretch, bold, caseLower, caseSensitive, caseUpper, clipboard, clipboardCheck, clipboardCopy, clipboardEdit, clipboardList, clipboardPaste, clipboardSignature, clipboardType, clipboardX, code, code2, codeSquare, columns, columns2, columns3, columns4, copy, copyCheck, copyMinus, copyPlus, copyX, edit, edit2, edit3, eraser, fileEdit, fileText, font, gripHorizontal, gripVertical, heading, heading1, heading2, heading3, heading4, heading5, heading6, highlighter, indent, indentDecrease, indentIncrease, italic, languages, letterSpacing, lineHeight, list, listChecks, listCollapse, listEnd, listFilter, listMinus, listMusic, listOrdered, listPlus, listRestart, listStart, listTodo, listTree, listVideo, listX, outdent, paintBucket, paintbrush, paintbrush2, palette, paragraph, pilcrow, pilcrowLeft, pilcrowRight, pilcrowSquare, quote, redo, redo2, removeFormatting, rotateCcw, rotateCw, ruler, scissors, separatorHorizontal, separatorVertical, slash, sortAsc, sortDesc, spellCheck, spellCheck2, strikethrough, subscript, superscript, table, table2, tableCellsMerge, tableCellsSplit, tableColumnsSplit, tableRowsSplit, text, textCursor, textCursorInput, textQuote, textSelect, type, underline, undo, undo2, wrapText, wrench',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Media & Devices (108 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'airplay, airplayVideo, airplayVideoOff, album, audioLines, audioWaveform, audioWaveformSquare, bluetooth, bluetoothConnected, bluetoothOff, bluetoothSearching, camera, cameraOff, cast, castVideo, castVideoOff, circlePlay, circleStop, computer, disc, disc2, disc3, ear, earOff, fastForward, film, gamepad, gamepad2, hardDrive, hardDriveDownload, hardDriveUpload, hdmiPort, headphones, headphonesOff, hdmiPort, headphones, headphonesOff, image, imageDown, imageMinus, imageOff, imagePlay, imagePlus, imageUp, images, laptop, laptop2, mic, mic2, micOff, micVocal, microphone, microphone2, microphoneOff, monitor, monitorCheck, monitorDot, monitorDown, monitorOff, monitorPause, monitorPlay, monitorSpeaker, monitorUp, monitorX, mouse, mousePointer, music, music2, music3, music4, pause, pauseCircle, phone, pictureInPicture, pictureInPicture2, play, playCircle, printer, radio, radioReceiver, radioTower, record, repeat, repeat1, rewind, scan, scanFace, scanLine, scanText, screenShare, screenShareOff, shuffle, skipBack, skipForward, speaker, squarePlay, squareStop, stopCircle, tablet, tablet2, tv, tv2, usb, video, videoOff, voicemail, volume, volume1, volume2, volumeX, webcam, wifi, wifiOff',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Security (36 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'alarmCheck, alarmClock, alarmMinus, alarmPlus, alarmX, badgeAlert, badgeCheck, badgeDollarSign, badgeHelp, badgeInfo, badgeMinus, badgePercent, badgePlus, badgeX, fingerprint, key, keyRound, keySquare, lock, lockKeyhole, lockKeyholeOpen, lockOpen, scanFace, scanLine, scanText, shield, shieldAlert, shieldBan, shieldCheck, shieldEllipsis, shieldHalf, shieldMinus, shieldOff, shieldPlus, shieldQuestion, shieldX',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Finance (79 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'badgeDollarSign, badgePercent, banknote, bitcoin, briefcase, building, building2, calculator, calendar, calendarClock, calendarDays, calendarRange, chartArea, chartBar, chartBarBig, chartBarDecreasing, chartBarIncreasing, chartBarStacked, chartCandlestick, chartColumn, chartColumnBig, chartColumnDecreasing, chartColumnIncreasing, chartColumnStacked, chartGantt, chartLine, chartNoAxesCombined, chartNoAxesColumn, chartNoAxesColumnDecreasing, chartNoAxesColumnIncreasing, chartPie, chartScatter, chartSpline, circleDollarSign, circleEuro, circlePound, coin, coins, creditCard, dollarSign, euro, factory, fileSpreadsheet, fileText, fileX, handshake, landmark, lineChart, package, package2, percent, percentCircle, percentDiamond, percentSquare, piggyBank, pocket, poundSterling, presentation, receipt, receiptCent, receiptEuro, receiptIndianRupee, receiptJapaneseYen, receiptPoundSterling, receiptRussianRuble, receiptSwissFranc, receiptText, receiptYuan, scale, scale3d, shoppingBag, shoppingBasket, shoppingCart, store, ticket, ticketCheck, ticketMinus, ticketPercent, ticketPlus, ticketSlash, ticketX, trendingDown, trendingUp, wallet, wallet2, walletCards, walletMinimal, yuan',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Weather (52 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'cloud, cloudDrizzle, cloudFog, cloudHail, cloudLightning, cloudMoon, cloudOff, cloudRain, cloudRainWind, cloudSnow, cloudSun, clouds, droplet, eye, eyeOff, gauge, moon, moonStar, snowflake, sun, sunDim, sunMedium, sunMoon, sunrise, sunset, thermometer, thermometerSnowflake, umbrella, wind, zap',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Maps & Travel (45 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'anchor, bus, car, carFront, carTaxi, compass, earth, flag, flagOff, fuel, gauge, globe, landmark, map, mapPin, mapPinCheck, mapPinMinus, mapPinOff, mapPinPlus, mapPinX, mapPinned, navigation, navigation2, plane, planeLanding, planeTakeoff, route, routeOff, ship, train, trainFront, trainTrack, waypoint',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Time & Calendar (28 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'alarmClock, calendar, calendarCheck, calendarClock, calendarCog, calendarDays, calendarHeart, calendarMinus, calendarOff, calendarPlus, calendarRange, calendarSearch, calendarX, clock, clock1, clock10, clock11, clock12, clock2, clock3, clock4, clock5, clock6, clock7, clock8, clock9, hourglass, timer, timerOff, timerReset, watch',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Education (31 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'atom, award, book, bookA, bookAudio, bookCheck, bookCopy, bookDashed, bookDown, bookHeadphones, bookHeart, bookImage, bookKey, bookLock, bookMarked, bookMinus, bookOpen, bookOpenCheck, bookOpenText, bookPlus, bookText, bookType, bookUp, bookUser, bookX, bookmark, bookmarkCheck, bookmarkMinus, bookmarkPlus, bookmarkX, books, brain, brainCircuit, brainCog, graduationCap, library, libraryBig, microchip, microscope, presentation, school, school2, userCheck, userCog, userPen, userX',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Charts & Analytics (49 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'activity, barChart, barChart2, barChart3, barChart4, barChartBig, barChartHorizontal, barChartHorizontalBig, chartArea, chartBar, chartBarBig, chartBarDecreasing, chartBarIncreasing, chartBarStacked, chartCandlestick, chartColumn, chartColumnBig, chartColumnDecreasing, chartColumnIncreasing, chartColumnStacked, chartGantt, chartLine, chartNetwork, chartNoAxesCombined, chartNoAxesColumn, chartNoAxesColumnDecreasing, chartNoAxesColumnIncreasing, chartPie, chartScatter, chartSpline, lineChart, pieChart, presentation, presentationChart, radar, radialChart, trendingDown, trendingUp',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Shapes (25 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'circle, circleDashed, circleDot, circleEllipsis, circleEqual, circleOff, circleSlash, circleSlash2, diamond, hexagon, octagon, pentagon, rectangleHorizontal, rectangleVertical, square, squareAsterisk, squareCode, squareDashedBottom, squareDashedBottomCode, squareDot, squareEqual, squareSlash, squareSplitHorizontal, squareSplitVertical, triangle, triangleRight',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Users (40 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'user, user2, userCheck, userCircle, userCircle2, userCog, userCog2, userMinus, userMinus2, userPen, userPen2, userPlus, userPlus2, userRound, userRoundCheck, userRoundCog, userRoundMinus, userRoundPen, userRoundPlus, userRoundSearch, userRoundX, userSearch, userSquare, userSquare2, userSquareCheck, userSquareMinus, userSquarePen, userSquarePlus, userSquareX, userX, userX2, users, users2, usersRound, usersSquare',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Development (57 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'binary, braces, brackets, bracketsSquare, bug, bug2, code, code2, codeSquare, codesandbox, command, cpu, database, fileCode, fileCode2, fileJson, fileJson2, fileTerminal, fileType, fileType2, folderCode, folderGit, folderGit2, function, functionSquare, gitBranch, gitBranchPlus, gitCommit, gitCompare, gitFork, gitMerge, gitPullRequest, github, gitlab, hash, package, package2, puzzle, regex, server, serverCog, serverCrash, serverOff, settings, settings2, squareFunction, squareTerminal, terminal, variable, wrench',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Layout (63 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'alignCenter, alignEnd, alignHorizontalCenter, alignHorizontalDistributeCenter, alignHorizontalDistributeEnd, alignHorizontalDistributeStart, alignHorizontalJustifyCenter, alignHorizontalJustifyEnd, alignHorizontalJustifyStart, alignHorizontalSpaceAround, alignHorizontalSpaceBetween, alignHorizontalStretch, alignJustify, alignLeft, alignRight, alignStart, alignVerticalCenter, alignVerticalDistributeCenter, alignVerticalDistributeEnd, alignVerticalDistributeStart, alignVerticalJustifyCenter, alignVerticalJustifyEnd, alignVerticalJustifyStart, alignVerticalSpaceAround, alignVerticalSpaceBetween, alignVerticalStretch, columns, columns2, columns3, columns4, dockBottom, dockLeft, dockRight, dockTop, frame, grid, grid2x2, grid2x2Check, grid2x2X, grid3x3, grid3x3X, layout, layoutDashboard, layoutGrid, layoutList, layoutTemplate, maximize, maximize2, minimize, minimize2, move, moveDiagonal, moveDiagonal2, moveDown, moveHorizontal, moveLeft, moveRight, moveUp, moveVertical, panelBottom, panelBottomClose, panelBottomInactive, panelBottomOpen, panelLeft, panelLeftClose, panelLeftInactive, panelLeftOpen, panelRight, panelRightClose, panelRightInactive, panelRightOpen, panelTop, panelTopClose, panelTopInactive, panelTopOpen, separatorHorizontal, separatorVertical, sidebar, sidebarClose, sidebarOpen',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Alerts & Feedback (26 total):',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'alertCircle, alertTriangle, badgeAlert, badgeCheck, badgeInfo, badgeMinus, badgePlus, badgeX, bell, bellMinus, bellOff, bellPlus, bellRing, bellX, check, checkCheck, checkCircle, checkSquare, info, minus, minusCircle, minusSquare, plus, plusCircle, plusSquare, x, xCircle, xSquare',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
