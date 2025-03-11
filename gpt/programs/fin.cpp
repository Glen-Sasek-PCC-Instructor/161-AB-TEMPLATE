// https://chatgpt.com/canvas/shared/67cfa83bb95c8191910ab85528a34dab

#include <iostream>

using namespace std;

// Function prototypes
void welcomeMessage();
void getInput(int &goal);
int calcTotal();
void printResults(int goal, int totalMiles);
void goodbyeMessage();

int main() {
    welcomeMessage();
    
    int goal;
    getInput(goal);
    
    if (goal <= 0) {
        cout << "No miles were tracked this week." << endl;
    } else {
        int totalMiles = calcTotal();
        printResults(goal, totalMiles);
    }
    
    goodbyeMessage();
    return 0;
}

void welcomeMessage() {
    cout << "Welcome to my Miles Tracker program." << endl;
}

void getInput(int &goal) {
    cout << "How many miles do you want to ride this week? ";
    cin >> goal;
}

int calcTotal() {
    int total = 0;
    string days[] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
    
    for (int i = 0; i < 7; i++) {
        int miles;
        do {
            cout << "How many miles did you ride on " << days[i] << "? ";
            cin >> miles;
            if (miles < 0) {
                cout << "Miles must be 0 or greater!" << endl;
            }
        } while (miles < 0);
        total += miles;
    }
    return total;
}

void printResults(int goal, int totalMiles) {
    cout << "\nYou rode " << totalMiles << " miles this week." << endl;
    
    if (totalMiles == goal) {
        cout << "Good job! You met your goal!" << endl;
    } else if (totalMiles > goal) {
        cout << "Great job! You exceeded your goal by " << (totalMiles - goal) << " miles!" << endl;
    } else {
        cout << "Uh oh! You missed your goal by " << (goal - totalMiles) << " miles!" << endl;
    }
}

void goodbyeMessage() {
    cout << "Keep riding!" << endl;
}
