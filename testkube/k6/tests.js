import http from 'k6/http';
import { check } from 'k6';

export const options = {

  stages: [
    { target: 200, duration: '30s' },
    { target: 0, duration: '30s' },
  ]

};

export default function () {

  const targetHost = __ENV.TARGET_HOSTNAME;
  const result = http.get(`http://${targetHost}:8080/health`);

  check(result, {
    'http response status code is 200': result.status === 200,
  });

}