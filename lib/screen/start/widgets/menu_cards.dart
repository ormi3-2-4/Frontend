import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuCards extends StatelessWidget {
  const MenuCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                    child: _MenuCard("운동기록", Icons.history, onTap: () {
                  // TODO: 운동 기록 페이지로 이동
                })),
                Flexible(child: _MenuCard("커뮤니티", Icons.people, onTap: () {
                  // TODO: 커뮤니티 페이지로 이동
                })),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(child: _MenuCard("추천 용품", Icons.fastfood, onTap: () {
                  // TODO: 용품 추천 페이지로 이동
                })),
                Flexible(child: _MenuCard("운동 코스 추천", Icons.search, onTap: () {
                  // TODO: 운동 코스 페이지로 이동
                })),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard(this.name, this.icon, {required this.onTap});

  final String name;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff424242),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            Icon(icon, color: Colors.white),
          ],
        )),
      ),
    );
  }
}
