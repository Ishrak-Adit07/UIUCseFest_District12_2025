import http from 'k6/http';
import { check, fail } from 'k6';
import { Counter } from 'k6/metrics';

// Custom counter to track failed requests
let failedChecks = new Counter('failed_checks');

export const options = {
    stages: [
        { duration: '1s', target: 10000 },  // Ramp-up to 1000 users in 1 second
        { duration: '30s', target: 10000 }, // Hold at 1000 users for 30 seconds
        { duration: '1s', target: 0 },     // Ramp-down to 0 users in 1 second
    ],
};

export default function () {
    const url = 'https://services.district12.xyz/cache/api/book-seat';

    const payload = JSON.stringify({
        train_id: "0c355a51-ebb3-4082-a262-703a09273801",
        seat_number: "A10",
        date: "2024-10-25",
        time: "08:00"
    });

    const params = {
        headers: {
            'Content-Type': 'application/json',
        },
    };

    const response = http.post(url, payload, params);

    const isCheckPassed = check(response, {
        'status is 200 or 400': (r) => r.status === 200 || r.status === 400,
    });

    // Print the active user and iteration number if the check fails
    if (!isCheckPassed) {
        failedChecks.add(1); // Increment failed checks counter

        console.log(`Check failed!`);
        console.log(`Active VU: ${__VU}`);
        console.log(`Iteration: ${__ITER}`);
        console.log(`Response status: ${response.status}`);
        console.log(`Response time: ${response.timings.duration} ms`);
    }
}


