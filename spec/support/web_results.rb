module WebResults
  def init!
    WebMock.disable_net_connect!
    ball_results = Array.new(7){ rand.to_s.reverse[0..1] }
    lotto_results = Array.new(7){ rand.to_s.reverse[0..1] }

    stub_request(:get, 'http://baidu.lecai.com/lottery/draw').
      to_return({ body: <<-HTML })
          <html>
            <head>
              <meta charset='UTF8'>
            </head>
            <body>
              <div class='main'>
                <div class='kj_box'>
                  <table>
                    <thead>
                      <th></th>
                      <th></th>
                      <th></th>
                      <th></th>
                    </thead>
                    <tbody>
                      <tr>
                        <td>双色球</td>
                        <td></td>
                        <td>#{ Date.today }</td>
                        <td>
                          <div class="ballbg">
                            #{ ball_results.map{ |num| "<span>#{ num }</span>" }.join("\n\n") }
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>大乐透</td>
                        <td></td>
                        <td>#{ Date.today }</td>
                        <td>
                          <div class="ballbg">
                            #{ lotto_results.map{ |num| "<span>#{ num }</span>" }.join("\n\n") }
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </body>
          </html>
        HTML
    {
      ball_results: ball_results,
      lotto_results: lotto_results
    }
  end
end