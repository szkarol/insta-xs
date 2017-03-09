class FakeVision
  class << self
    def annotation_response
      response_params = {
        faces:     ["476,54 531,54 531,109 476,109 476,54", "235,40 293,40 293,97 235,97 235,40"],
        labels:    ["photography", "monochrome photography"],
        logos:     ["Abibas", "Sofixy"],
        landmarks: ["Eiffel Tower,48.858461,2.294351"]
      }

      Hashie::Mash.new(response_params)
    end

    def annotation
      params = {
        labels: [
          { description: "people",          score: 0.93 },
          { description: "black and white", score: 0.92 },
          { description: "people",          score: 0.91 }
        ],
        faces: [
          {
            bounds: {
              head: [{ x: 464, y: 31 }, { x: 543, y: 31 }, { x: 543, y: 123 }, { x: 464, y: 123 }],
              face: [{ x: 476, y: 54 }, { x: 531, y: 54 }, { x: 531, y: 109 }, { x: 476, y: 109 }]
            }
          },
          {
            bounds: {
              head: [{ x: 219, y: 14 }, { x: 300, y: 14 }, { x: 300, y: 108 }, { x: 219, y: 108 }],
              face: [{ x: 235, y: 40 }, { x: 293, y: 40 }, { x: 293, y: 97 },  { x: 235, y: 97  }]
            }
          }
        ],
        logos: [
          {
            description: "Abibas",
            score: 0.22
          },
          {
            description: "Sofixy",
            score: 0.25
          }
        ],
        landmarks: [
          {
            description: "Eiffel Tower",
            locations: [
              {
                latitude:  48.858461,
                longitude: 2.294351
              }
            ]
          }
        ]
      }

      Hashie::Mash.new(params)
    end
  end
end
