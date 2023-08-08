import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count = _count + 1;
    notifyListeners();
  }

  void decrement() {
    _count = _count > 0 ? _count - 1 : _count;
    notifyListeners();
  }
}

///
///===========  Add Items ================///
///
class AddtoCartOffine extends ChangeNotifier {
  List<String> _addItem = [];
  List<String> get addItem => _addItem;

  void toggleAdd(String addItem) {
    final isExist = _addItem.contains(addItem);
    if (isExist) {
      _addItem.remove(addItem);
    } else {
      _addItem.add(addItem);
    }
    notifyListeners();
  }

  bool isExisted(String word) {
    final isExisted = _addItem.contains(word);
    return isExisted;
  }

  void removeItem() {
    _addItem = [];
  }
}

///============================= Store Selected Item Index ==========================///
///

class CircleAvatarProvider extends ChangeNotifier {
  List<int> _selectedIndices = [];

  List<int> get selectedIndices => _selectedIndices;

  void toggleSelection(int index) {
    if (_selectedIndices.contains(index)) {
      _selectedIndices.remove(index);
    } else {
      _selectedIndices.add(index);
    }
    notifyListeners();
  }

  bool isIndexSelected(int index) {
    return _selectedIndices.contains(index);
  }
}

//=================================  Like Dis Like =================================//
//
class LikeDislikeProvider extends ChangeNotifier {
  Map<int, bool> _likeStatusMap = {};

  bool isLiked(int itemId, bool getLiked) {
    return _likeStatusMap[itemId] ?? getLiked;
  }

  void toggleLike(int itemId, bool getLiked) {
    bool currentStatus = isLiked(itemId, getLiked);
    _likeStatusMap[itemId] = !currentStatus;
    notifyListeners();
  }
}

//================================= verified follow =================================//

class VerifiedFollowProvider extends ChangeNotifier {
  Map<int, bool> _likeStatusMap = {};

  bool isFollow(int itemId, bool getFollow) {
    // Use the getLiked value to set the default like status
    return _likeStatusMap[itemId] ?? getFollow;
  }

  void toggleFollow(int itemId, bool getLiked) {
    bool currentStatus = isFollow(itemId, getLiked);
    _likeStatusMap[itemId] = !currentStatus;
    notifyListeners();
  }
}

///======================Comments Counts =======================///

class CommetsProvider extends ChangeNotifier {
  Map<int, int> _commentCountMap = {};

  int getCommentCount(int itemId) {
    return _commentCountMap[itemId] ?? 0;
  }

  void incrementCommentCount(int itemId) {
    int currentCount = getCommentCount(itemId);
    _commentCountMap[itemId] = currentCount + 1;
    notifyListeners();
  }

  void decrementCommentCount(int itemId) {
    int currentCount = getCommentCount(itemId);
    if (currentCount > 0) {
      _commentCountMap[itemId] = currentCount - 1;
      notifyListeners();
    }
  }
}
