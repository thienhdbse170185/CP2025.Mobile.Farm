import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';

/// Formats a date string from ISO format to a more readable format
String formatDate(String? date) {
  if (date == null || date.isEmpty) {
    return "N/A"; // Return a default value if the date is null or empty
  }
  try {
    final DateTime parsedDate = DateTime.parse(date);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(parsedDate);
  } catch (e) {
    return "Invalid date"; // Return an error message if parsing fails
  }
}

/// Converts status code to human-readable text in Vietnamese
String getStatusText(String status) {
  switch (status) {
    case StatusDataConstant.inProgress:
      return StatusDataConstant.inProgressVn;
    case StatusDataConstant.done:
      return StatusDataConstant.doneVn;
    case StatusDataConstant.pending:
      return StatusDataConstant.pendingVn;
    case StatusDataConstant.overdue:
      return StatusDataConstant.overdueVn;
    case StatusDataConstant.cancelled:
      return StatusDataConstant.cancelledVn;
    default:
      return status;
  }
}

/// Returns the background color for a task status
Color getStatusColor(String status) {
  switch (status) {
    case StatusDataConstant.inProgress:
      return Colors.yellow.shade200;
    case StatusDataConstant.done:
      return Colors.green.shade200;
    case StatusDataConstant.pending:
      return Colors.grey.shade300;
    case StatusDataConstant.overdue:
      return Colors.red.shade200;
    case StatusDataConstant.cancelled:
      return Colors.grey.shade400;
    default:
      return Colors.grey.shade300;
  }
}

/// Returns the text color for a task status
Color getStatusTextColor(String status) {
  switch (status) {
    case StatusDataConstant.inProgress:
      return Colors.black;
    case StatusDataConstant.done:
      return Colors.white;
    case StatusDataConstant.pending:
      return Colors.black;
    case StatusDataConstant.overdue:
      return Colors.white;
    case StatusDataConstant.cancelled:
      return Colors.black;
    default:
      return Colors.black;
  }
}

/// Returns the color for a priority level
Color getPriorityColor(int priority) {
  switch (priority) {
    case 1:
      return Colors.red.shade200;
    case 2:
      return Colors.yellow.shade200;
    case 3:
      return Colors.lightBlue.shade300;
    default:
      return Colors
          .lightBlue.shade200; // Treat priorities greater than 3 as "Thấp"
  }
}

/// Returns the text representation of a priority level
String getPriorityText(int priority) {
  switch (priority) {
    case 0:
      return 'N/A';
    case 1:
      return 'Cao';
    case 2:
      return 'Trung bình';
    case 3:
      return 'Thấp';
    default:
      return 'Thấp';
  }
}
