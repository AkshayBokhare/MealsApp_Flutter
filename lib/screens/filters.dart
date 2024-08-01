import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key, });


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFIlters =ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
      ),
      drawer: MainDrawer(onSelectScreen: (identifier) {
        Navigator.of(context).pop();
        if (identifier == 'meals') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => const TabsScreen(),
          ));
        }
      }),
    body:  Column(
          children: [
            SwitchListTile(
              value: activeFIlters[Filter.glutenFree] !,
              onChanged: (isChecked) {
               ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
                 value: activeFIlters[Filter.lactoseFree] !,
              onChanged: (isChecked) {
               ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
           
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include Lactose-freeg meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
                value: activeFIlters[Filter.vegetarianFree] !,
              onChanged: (isChecked) {
               ref.read(filterProvider.notifier).setFilter(Filter.vegetarianFree, isChecked);
           
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include Vegetarian meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
               value: activeFIlters[Filter.veganFree] !,
              onChanged: (isChecked) {
               ref.read(filterProvider.notifier).setFilter(Filter.veganFree, isChecked);
           
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include Vegan meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      );
  }
}
