import 'dart:io';

void main(List<String> arguments) {
  bool isLoop = false; // Input data is re-entered if incorrect
  final List<int> list = []; // List of numbers

  do {
    print('Enter a single line of five space-separated positive integers: ');
    String? str = stdin.readLineSync(); // Reads a line from stdin
    // Check str is null or str is emty -> exit
    if (str == null || str.isEmpty) {
      return;
    }
    try {
      // Splits the string at matches of ' '
      var listString = str.split(' ');
      print(listString);
      for (var s in listString) {
        int num = int.parse(s);
        // Check num is positive integer
        if (num >= 1) {
          list.add(num); // Add num in list
        }
      }

      if (list.length == 5) {
        isLoop = false; // change isLoop = false
      } else {
        print('Data input is not in the correct format!');
        isLoop = true; // change isLoop = true
        list.clear(); // Removes all objects from this list
      }
    } catch (e) {
      print('Error: $e');
      print('Data input is not in the correct format!');
      isLoop = true; // change isLoop = true
      list.clear(); // Removes all objects from this list
    }
  } while (isLoop);

  // Sort list
  List<int> sortList = _sortList(list);

  print('==============================================================');
  // Call _miniMaxSum
  _miniMaxSum(sortList);

  // Sum everything except element
  for (var l in list) {
    print('Sum everything except $l: ${_sumList(list) - l}');
  }

  // Sort list
  print('\nSort ascending: $sortList');
  // Count total of array
  print('Count total of array: ${list.length}');
  // Find min in array
  print('Min in array: ${_min(sortList)}');
  // Find max in array
  print('Max in array: ${_max(sortList)}');
  // Find even elements in array
  print('Even elements in array: ${_evenList(sortList)}');
  // Find odd elements in array
  print('Odd elements in array: ${_oddList(sortList)}');
}

/// Calculate the sum of the elements in the list
int _sumList(List<int> list) {
  int sum = 0; // Init sum
  for (int num in list) {
    sum += num; // The elements are accumulated and assigned to the sum
  }
  return sum;
}

/// Sort ascending
List<int> _sortList(List<int> list) {
  list.sort(); // Handle sort
  return list;
}

/// Return minimum sum and maximum sum
void _miniMaxSum(List<int> sortList) {
  int miniSum = 0;
  int maxSum = 0;

  // sum of the elements in the list
  int sumList = _sumList(sortList);

  // Sum elements except max element
  miniSum = sumList - _max(sortList);

  // Sum elements except min element
  maxSum = sumList - _min(sortList);

  print('$miniSum $maxSum\n');
}

/// Return max element
int _max(List<int> sortList) {
  return sortList.last;
}

/// Return min element
int _min(List<int> sortList) {
  return sortList.first;
}

/// Return even number list
List<int> _evenList(List<int> list) {
  List<int> evenList = [];
  for (int num in list) {
    // Check num is even
    if (num.isEven) {
      evenList.add(num); // Add num in evenList
    }
  }
  return evenList;
}

/// Return odd number list
List<int> _oddList(List<int> list) {
  List<int> oddList = [];
  for (int num in list) {
    // Check num is odd
    if (num.isOdd) {
      oddList.add(num); // Add num in evenList
    }
  }
  return oddList;
}
